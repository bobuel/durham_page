class RequestsController < ApplicationController
	before_filter :fetch_request, :validate_access, only: [:show, :edit, :update, :destroy, :toggle_submitted, :toggle_viewed, :toggle_designed, :estimate_price]

	before_filter :validate_admin, only: [:all_requests, :all_submitted_requests, :toggle_viewed, :toggle_designed]

	def new 
		@request = Request.new
	end

	def create
		@request = current_user.requests.build(request_params)

		if @request.save 
			redirect_to [current_user, @request], notice: 'Create Successful'
		else
			render user_requests_path(current_user), notice: 'Create Unsuccessful'
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
			redirect_to user_requests_path(current_user), notice: 'Delete Successful'
		else
			redirect_to [current_user, @request], notice: 'Delete Unsuccessful'
		end
	end

	def toggle_submitted
		if @request.toggle_submitted
			redirect_to [current_user, @request], notice: 'Request Submitted'
		else
			redirect_to user_requests_path(current_user), notice: 'Request Not Submitted'
		end
	end

	def toggle_viewed
		if @request.toggle_viewed
			redirect_to [current_user, @request], notice: 'Request Viewed'
		else
			redirect_to user_requests_path(current_user), notice: 'Request Not Viewed'
		end
	end

	def toggle_designed
		if @request.toggle_designed
			redirect_to [current_user, @request], notice: 'Request Designed'
		else
			redirect_to user_requests_path(current_user), notice: 'Request Not Designed'
		end
	end

	def estimate_price
		msg = "$ #{@request.estimate_price_cents} cents."
		redirect_to [current_user, @request], notice: msg 
	end


	def all_requests
		@requests = Request.all
		render 'index'
	end

	def all_submitted_requests 
		@requests = Request.where(submitted: true)
		render 'index'
	end

	def new_request_from_tag
		@tag = Tag.find(params[:tag_id])
		@request_plants = @tag.plants
		@request = Request.new
		render 'new'
	end

	private 

		def request_params
			params.require(:request).permit(:user_id, :space_id, :description, {request_plant_ids: []}, :submitted, :viewed, :designed)
		end

		def validate_access
			@request = Request.find(params[:id])
			validate_user_bln(@request) || validate_admin_bln
		end

		def fetch_request
			@request = Request.find(params[:id])
		end
end
