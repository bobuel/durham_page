class PlantersController < ApplicationController
	before_filter :validate_admin, only: [:new, :create, :edit, :update, :destroy] 

	def new 
		@planter = Planter.new
	end

	def create 
		@planter = Planter.new(planter_params)

		if @planter.save 
			redirect_to @planter, notice: "Create Successful"
		else
			render 'new'
		end
	end

	def show
		@planter = Planter.find(params[:id])
		@tags = @planter.tags 
	end

	def edit 
		@planter = Planter.find(params[:id])
	end

	def update
		@planter = Planter.find(params[:id])

		if @planter.update(planter_params)
			redirect_to @planter, notice: "Update Successful"
		else
			render 'edit'
		end
	end

	def destroy
		@planter = Planter.find(params[:id])

		if @planter.destroy
			redirect_to planters_path, notice: "Destroy Successful"
		else
			redirect_to planters_path, notice: "Destroy Unsuccessful"
		end
	end

	def index
		@planters = Planter.all
	end

	private 

		def planter_params
			params.require(:planter).permit(:name, :length_ft, :length_inch, :width_ft, :width_inch, :height_ft, :height_inch, :depth_ft, :depth_inch, {tag_ids: []})
		end

end
