class RequestAssignmentsController < ApplicationController
	before_filter :fetch_request_assignment, only: [:show, :edit, :update, :destroy]

	def new 
		@request_assignment = RequestAssignment.new(request_id: params[:request_id])
		@requests = Request.find(params[:request_id])
	end

	def create 
		@request_assignment = RequestAssignment.new(request_assignment_params)
		
		if @request_assignment.save 
			@request = Request.find(params[:request_id])
			redirect_to [@request, @request_assignment], notice: "Created Successfully"
		else
			render 'new', notice: 'Create Unsuccessful'
		end
	end

	def show 
	end

	def edit
		@request = Request.find(params[:request_id])
	end

	def update
		if @request_assignment.update(request_assignment_params)
			@request = Request.find(params[:request_id])
			redirect_to [@request, @request_assignment], notice: "Updated Successfully"
		else
			render 'edit', notice: 'Update Unsuccessful'
		end
	end

	def destroy 
		@request = Request.find(params[:request_id])
		if @request_assignment.destroy
			redirect_to request_request_assignments_path(@request), notice: 'Delete Successful'
		else
			redirect_to request_request_assignments_path(@request), notice: 'Delete Unsuccessful'
		end
	end

	def index 
		@request_assignments = Request.find(params[:request_id]).request_assignments
	end

	def plant_request_assignment
		@request = current_user.requests.first
		@plant = Plant.find(params[:plant_id])
		@request_assignment = RequestAssignment.new
		render 'new'
	end


	private

		def request_assignment_params
			params.require(:request_assignment).permit(:request_plant_id, :request_id, :quantity, :price_cents_when_requested, :price_cents_estimate, :description)
		end

		def fetch_request_assignment
			@request_assignment = RequestAssignment.find(params[:id])
		end

end
