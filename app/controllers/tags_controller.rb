class TagsController < ApplicationController
	before_filter :validate_admin, except: [:index, :show]

	def new 
		@tag = Tag.new 
	end

	def create 
		@tag = Tag.new(tag_params)

		if @tag.save 
			redirect_to @tag, notice: "Create Successful"
		else
			render 'edit'
		end
	end

	def edit
		@tag = Tag.find(params[:id])
	end

	def update 
		@tag = Tag.find(params[:id])

		if @tag.update(tag_params)
			redirect_to @tag, notice: "Update Successful"
		else
			render 'edit'
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

	def destroy
		@tag = Tag.find(params[:id])

		if @tag.destroy
			redirect_to tags_path, notice: "Destroy Successful"
		else
			redirect_to @tag, notice: "Destroy Unsuccessful"
		end
	end

	private

		def tag_params
			params.require(:tag).permit(:name, :description, {plant_ids: []}, {planter_ids: []})
		end

end
