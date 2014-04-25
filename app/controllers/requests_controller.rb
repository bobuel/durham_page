class RequestsController < ApplicationController
	before_filter :validate_access, except: [:new, :create, :index]

	before_filter :fetch_request, except: [:new, :create, :index]

	def new 
		@request = Request.new
	end

	def create
		@request = current_user.requests.build(request_params)

		if @request.save 
			@request.set_new_bools
			redirect_to [current_user, @request], notice: 'Create Successful'
		else
			render 'index'
		end
	end

	def show
		@plants = @request.request_plants
	end

	def edit 
	end

	def update
		if @request.update(request_params)
			redirect_to [current_user, @request], notice: 'Update Successful'
		else
			render 'edit'
		end
	end

	def index 
		@requests = current_user.requests
	end

	def destroy
		if @request.destroy
			render 'index', notice: 'Delete Successful'
		else
			render 'index', notice: 'Delete Unsuccessful'
		end
	end

	def toggle_submit
		if @request.toggle_submit
			redirect_to [current_user, @request], notice: 'Request Submitted'
		else
			redirect_to user_requests_path(current_user)
		end
	end

	def estimate_price
		msg = "$ #{@request.estimate_price_cents} cents."
		redirect_to [current_user, @request], notice: msg 
	end

	private 

		def request_params
			params.require(:request).permit(:user_id, :space_id, :description, {request_plant_ids: []}, :submitted, :viewed, :designed)
		end


		def validate_access
			@request = Request.find(params[:id])

			if @request.user_id == current_user.id
				# we good
			else 
				redirect_to root_path, notice: "Access Denied" 
			end
		end

		def fetch_request
			@request = Request.find(params[:id])
		end
end
