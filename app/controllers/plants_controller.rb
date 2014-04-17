class PlantsController < ApplicationController
	before_filter :validate_admin, only: [:new, :create, :edit, :update, :destroy] 

	def new 
		@plant = Plant.new
	end

	def create 
		@plant = Plant.new(plant_params)

		if @plant.save 
			redirect_to @plant, notice: 'Plant Created'
		else
			redirect_to new_plant_path, notice: 'Plant Not Created'
		end
	end

	def show 
		@plant = Plant.find(params[:id])
		@tags = @plant.tags 
	end

	def index 
		@plants = Plant.all
	end

	def edit 
		@plant = Plant.find(params[:id])
	end

	def update 
		@plant = Plant.find(params[:id])

		if @plant.update(plant_params)
			redirect_to @plant, notice: "Update Successful"
		else
			redirect_to @plant, notice: "Update Unsuccessful"
		end
	end

	def destroy
		@plant = Plant.find(params[:id])

		if @plant.destroy
			redirect_to plants_path, notice: "Destroy Successful"
		else
			redirect_to @plant, notice: "Destroy Unsuccessful"
		end
	end

	private 

		def plant_params
			params.require(:plant).permit(:name, :length_ft, :length_inch, :width_ft, :width_inch, :height_ft, :height_inch, :area_ft, :area_inch, :volume_ft, :volume_inch, :description, {tag_ids: []})
		end

end
