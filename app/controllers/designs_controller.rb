class DesignsController < ApplicationController
	before_filter :fetch_design, only: [:show, :edit, :update, :destroy]

	before_filter :validate_access, except: [:new, :create, :index, :request_suggested_designs, :all_designs, :space_suggested_designs]

	before_filter :validate_access_request, only: [:suggested_designs]

	before_filter :validate_admin, only: [:all_designs, :toggle_active]

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
		@designs = Design.where(request_id: current_user.requests.ids)
	end

	def all_designs
		@designs = Design.all
		render 'index'
	end

	def request_suggested_designs
		@request = Request.find(params[:request_id])
		@designs = @request.designs 
		render 'index'
	end

	def space_suggested_designs
		@space = Space.find(params[:space_id])
		@designs = @space.designs
		render 'index'
	end

	def toggle_reviewed 
		if @design.toggle_reviewed
			redirect_to [current_user, @design], notice: "Design Reviewed"
		else
			redirect_to [current_user, @design], notice: "Design Not Reviewed"
		end
	end

	def toggle_active 
		if @design.toggle_active
			redirect_to [current_user, @design], notice: "Design Active"
		else
			redirect_to [current_user, @design], notice: "Design Not Active"
		end
	end

	def toggle_accepted
		if @design.toggle_accepted
			redirect_to [current_user, @design], notice: "Design Accepted"
		else
			redirect_to [current_user, @design], notice: "Design Not Accepted"
		end
	end
	
	private

		def design_params
			params.require(:design).permit(:user_id, :space_id, :request_id, :description, :notes, :price_cents, :reviewed, :accepted, :active, {design_plant_ids: []}, {design_planters_ids: []})
		end

		def fetch_design
			@design = Design.find(params[:id])
		end

		def validate_access
			@design = Design.find(params[:id])
			validate_admin_bln || validate_user_bln(@design) 
		end

		def validate_access_request 
			@request = Request.find(params[:request_id])
			validate_user(@request)
		end
end
