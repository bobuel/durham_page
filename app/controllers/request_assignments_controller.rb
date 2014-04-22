class RequestAssignmentsController < ApplicationController

	def new 
		@request_assignment = RequestAssignment.new(request_id: params[:request_id])
		@request = Request.find(params[:request_id])
	end

	def create 
		@request_assignment = RequestAssignment.new(request_assignment_params)
		@request_assignment.price_cents_when_requested = Plant.find(params[:request_assignment][:request_plant_id]).price_cents

		if @request_assignment.save 
			@request = Request.find(params[:request_id])
			redirect_to [@request, @request_assignment], notice: "Created Successfully"
		else
			render 'new', notice: 'Create Unsuccessful'
		end
	end

	def show 
		@request_assignment = RequestAssignment.find(params[:id])
	end

	def edit
		@request_assignment = RequestAssignment.find(params[:id])
		@request = Request.find(params[:request_id])
	end

	def update
		@request_assignment = RequestAssignment.find(params[:id])

		if @request_assignment.update(request_assignment_params)
			@request = Request.find(params[:request_id])
			redirect_to [@request, @request_assignment], notice: "Updated Successfully"
		else
			render 'edit', notice: 'Update Unsuccessful'
		end
	end

	def destroy 
		@request_assignment = RequestAssignment.find(params[:id])

		if @request_assignment.destroy
			render 'index', notice: 'Delete Successful'
		else
			render 'index', notice: 'Delete Unsuccessful'
		end
	end

	def index 
		@request_assignments = Request.find(params[:request_id]).request_assignments
	end

	private

		def request_assignment_params
			params.require(:request_assignment).permit(:request_plant_id, :request_id, :quantity, :price_cents_when_requested, :price_cents_estimate, :description)
		end

end
