class PlantsController < ApplicationController
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
	end

	def index 
		@plants = Plant.all
	end

	private 

		def plant_params
			params.require(:plant).permit(:name, :length, :width, :height, :area, :volume, :description)
		end
end
