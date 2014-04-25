class TagAssignmentsController < ApplicationController
	before_filter :validate_admin

	before_filter :fetch_tag_assignment, except: [:new, :create, :index]

	def index
		@tag_assignments = TagAssignment.all
	end

	def new 
		@tag_assignment = TagAssignment.new
	end

	def create 
		@tag_assignment = TagAssignment(tag_assignment_params)

		if @tag_assignment.save 
			@tag = Tag.find(params[:tag_id])
			redirect_to [@tag, @tag_assignment], notice: "Create Successful"
		else
			redirect_to tags_path, notice: "Create Unsuccessful"
		end
	end

	def show
	end

	def edit
	end

	def update 
		if @tag_assignment.update(tag_params)
			@tag = Tag.find(params[:tag_id])
			redirect_to [@tag, @tag_assignment], notice: "Update Successful"
		else
			redirect_to @tag,_assignment notice: "Update Unsuccessful"
		end
	end

	def destroy
		if @tag_assignment.destroy
			redirect_to tags_path, notice: "Delete Successful"
		else
			redirect_to @tag_assignment, notice: "Delete Unsuccessful"
		end
	end

	private

		def tag_assignmnet_params
			params.require(:tag_assignment).permit(:plant_id, :planter_id, :tag_id)
		end

		def fetch_tag_assignment
			@tag_assignment = TagAssignment.find(params[:id])
		end
end
