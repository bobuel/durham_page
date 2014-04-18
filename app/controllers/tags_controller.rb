class TagsController < ApplicationController
	before_filter :validate_admin

	def new 
		@tag = Tag.new 
	end

	def create 
		@tag = Tag.new(tag_params)

		if @tag.save 
			redirect_to @tag, notice: "Create Successful"
		else
			redirect_to new_tag_path, notice: "Create Unsuccessful"
		end
	end

	def edit
		@tag = Tag.find(params[:id])
	end

	def update 
		@tag = Tag.find(params[:id])

		if @tag.udpate
			redirect_to @tag, notice: "Update Successful"
		else
			redirect_to new_tag_path, notice: "Update Unsuccessful"
		end
	end

	def show 
		@tag = Tag.find(params[:id])
		@plants = @tag.plants
		@planters = @tag.planters
	end

	def index
		@tags = Tag.all
	end

	private

		def tag_params
			params.require(:tag).permit(:name, :description)
		end

end
