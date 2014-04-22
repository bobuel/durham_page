class RequestsController < ApplicationController
	before_filter :validate_access, only: [:show, :edit, :update, :destroy]

	def new 
		@request = Request.new
	end

	def create
		@request = current_user.requests.build(request_params)

		if @request.save 
			redirect_to [current_user, @request], notice: 'Create Successful'
		else
			render 'new'
		end
	end

	def show
		@request = Request.find(params[:id])
		@plants = @request.request_plants
	end

	def edit 
		@request = Request.find(params[:id])
	end

	def update
		@request = Request.find(params[:id])

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
		@request = Request.find(params[:id])

		if @request.destroy
			render 'index', notice: 'Delete Successful'
		else
			render 'index', notice: 'Delete Unsuccessful'
		end
	end

	private 

		def request_params
			params.require(:request).permit(:user_id, :space_id, :description, {request_plant_ids: []})
		end


		def validate_access
			@request = Request.find(params[:id])

			if @request.user_id == current_user.id
				# we good
			else 
				redirect_to root_path, notice: "Access Denied" 
			end
		end
end
