class PlantersController < ApplicationController
	before_filter :get_planter, only: [:show, :edit, :update, :destroy]

	def new 
		@planter = Planter.new
	end

	def create 
		@planter = Planter.new(planter_params)

		if @planter.save 
			redirect_to @planter, notice: "Create Successful"
		else
			redirect_to new_planter_path, notice: "Create Unsuccessful"
		end
	end

	def show
		@planter = get_planter
	end

	def edit 
		@planter = get_planter
	end

	def update
		@planter = get_planter

		if @planter.update(planter_params)
			redirect_to @planter, notice: "Update Successful"
		else
			redirect_to @planter, notice: "Update Unsucessful"
		end
	end

	def destroy
		@planter = get_planter

		if @planter.destroy
			redirect_to planters_path, notice: "Delete Successful"
		else
			redirect_to @planter, notice: "Delete Unsuccessful"
		end
	end

	def index
		@planters = Planter.all
	end

	private 

		def planter_params
			params.require(:planter).permit(:name, :length, :width, :height)
		end

		def get_planter
			Planter.find(params[:id])
		end

end
