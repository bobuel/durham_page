class DesignsController < ApplicationController
	before_filter :fetch_design, only: [:show, :edit, :update, :destroy, :gen_assignments]

	before_filter :validate_access, except: [:new, :create, :index, :suggested_designs, :all_designs]

	before_filter :validate_access_suggested, only: [:suggested_designs]

	before_filter :validate_admin, only: [:all_designs, :toggle_active]

	def new 
		@design = Design.new
	end 

	def create
		@design = current_user.designs.create(design_params)
		@design.space_id = Request.find(params[:design][:request_id]).space_id

		if @design.save
			redirect_to @design, notice: "Create Successful"
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
			redirect_to @design, notice: "Update Successful"
		else
			render 'edit', notice: "Update Unsuccessful"
		end
	end

	def destroy
		if @design.destroy
			redirect_to designs_path, notice: "Delete Successful"
		else
			redirect_to designs_path, notice: "Delete Unsuccessful"
		end
	end

	def index 
		@designs = Design.where(request_id: current_user.requests.ids)
	end

	def all_designs
		@designs = Design.all
		render 'index'
	end

	def suggested_designs
		if(params[:request_id].blank?)
			@space = Space.find(params[:space_id])
			@designs = @space.designs
		else
			@request = Request.find(params[:request_id])
			@designs = @request.designs 
		end
		render 'index'
	end

	def toggle_reviewed 
		if @design.toggle_reviewed
			redirect_to @design, notice: "Design Reviewed"
		else
			redirect_to @design, notice: "Design Not Reviewed"
		end
	end

	def toggle_active 
		if @design.toggle_active
			redirect_to @design, notice: "Design Active"
		else
			redirect_to @design, notice: "Design Not Active"
		end
	end

	def toggle_accepted
		if @design.toggle_accepted
			redirect_to @design, notice: "Design Accepted"
		else
			redirect_to @design, notice: "Design Not Accepted"
		end
	end

	def gen_assignments 
		@design = Design.find(params[:id])
		@request = Request.find(@design.request_id)
		@request.request_plants.each do |design_plant| 
			@design_assignment = DesignAssignment.new(design_plant: design_plant, design: @design)
			redirect_to @design, notice: "Create Unsuccessful" unless @design_assignment.save 
		end
		redirect_to @design, notice: "Create Successful"
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

		def validate_access_suggested 
			if params[:request_id].blank?
				validate_admin
			else
				@request = Request.find(params[:request_id])
				validate_user(@request)		
			end
		end
end
