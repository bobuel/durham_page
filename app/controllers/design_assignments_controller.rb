class DesignAssignmentsController < ApplicationController
	before_filter :fetch_design_assignment, only: [:show, :edit, :update, :destroy]

	before_filter :validate_access, only: [:show]

	before_filter :validate_admin, except: [:show, :index]

	def new 
		@design_assignment = DesignAssignment.new(design_id: params[:design_id])
	end

	def create 
		@design_assignment = DesignAssignment.new(design_assignment_params)

		if @design_assignment.save 
			@design = Design.find(params[:design_id])
			redirect_to [@request, @request_assignment], notice: "Create Successful"
		else
			redirect_to user_designs_path(current_user), notice: "Create Unsuccessful"
		end
	end

	def show
	end

	def edit
	end

	def update
		if @design_assignment.update(design_assignment_params)
			redirect_to [@design, @design_assignment], notice: "Update Successful"
		else
			redirect_to [@design, @design_assignment], notice: "Update Unsuccessful"
		end
	end

	def destroy
		if @design_assignment.destroy
			redirect_to user_requests_path(current_user), notice: "Destroy Successful"
		else
			redirect_to designs_path, notice: "Destroy Unsuccessful"
		end
	end

	def index 
		@design_assignments = DesignAssignment.where(params[:design_id])
		@design = Design.find(params[:design_id])
	end

	private 

		def design_assignment_params
			params.require(:design_assignment).permit(:design_id, :plant_id, :planter_id, :user_id, :included, :quantity, :description, :comments)
		end

		def fetch_design_assignment
			@design_assignment = DesignAssignment.find(params[:id])
			@design = Design.find(@design_assignment.design_id)
		end

		def validate_access
			@design_assignment = DesignAssignment.find(params[:id])
			validate_admin_bln || validate_user_bln(@design.request.user_id) 
		end
end
