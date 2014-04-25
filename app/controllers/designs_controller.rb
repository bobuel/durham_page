class DesignsController < ApplicationController
	before_filter :fetch_design, except: [:new, :create, :index, :suggested_designs]

	before_filter :validate_access, except: [:new, :create, :index, :suggested_designs]

	before_filter :validate_access_request, only: [:suggested_designs]

	def new 
		@design = Design.new
	end 

	def create
		@design = current_user.designs.create(design_params)

		if @design.save
			redirect_to [current_user, @design], notice: "Create Successful"
		else
			render 'new', notice: "Create Unsuccessful"
		end
	end

	def show
	end

	def edit
	end

	def update
		if @design.update(design_params)
			redirect_to [current_user, @design], notice: "Update Successful"
		else
			render 'edit', notice: "Update Unsuccessful"
		end
	end

	def destroy
		if @design.destroy
			redirect_to user_designs_path(current_user), notice: "Delete Successful"
		else
			redirect_to user_designs_path(current_user), notice: "Delete Unsuccessful"
		end
	end

	def index 
		@designs = current_user.designs
	end

	def suggested_designs
		@request = Request.find(params[:request_id])
		@designs = @request.designs 
		render 'index'
	end
	
	private

		def design_params
			params.require(:design).permit(:user_id, :space_id, :request_id, :description, :notes, :price_cents, :reviewed, :accepted, :active)
		end

		def fetch_design
			@design = Design.find(params[:id])
		end

		def validate_access
			@design = Design.find(params[:id])
			validate_user(@design)
		end

		def validate_access_request 
			@request = Request.find(params[:request_id])
			validate_user(@request)
		end
end
