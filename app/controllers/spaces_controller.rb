class SpacesController < ApplicationController
	before_filter :validate_access, only: [:show, :edit, :update, :destroy]

	def new 
		@space = Space.new
	end

	def create
		@space = current_user.spaces.build(space_params)
		@space.address_id = space_params[:address_id]

		if @space.save
			redirect_to [current_user, @space], notice: 'Space Created'
		else
			render text: space_params.inspect
		end
	end

	def show 
		@space = Space.find(params[:id])
	end

	def index
		@spaces = current_user.spaces
	end

	def edit
		@space = Space.find(params[:id])
	end

	def update
		@space = Space.find(params[:id])

		if @space.update(space_params)
			redirect_to user_spaces_path(current_user), notice: 'Update Successful'
		else
			redirect_to user_spaces_path(current_user), notice: 'Update Unsuccessful'
		end
	end

	def destroy
		@space = Space.find(params[:id])

		if @space.destroy
			redirect_to user_spaces_path(current_user), notice: 'Delete Successful'
		else
			redirect_to user_spaces_path(current_user), notice: 'Delete Unsuccessful'
		end
	end

	private 

		def space_params
			params.require(:space).permit(:address_id, :name, :length_ft, :length_inch, :width_ft, :width_inch, :height_ft, :height_inch, :is_rooftop, :is_ground, :floor, :description)
		end

		def validate_access
			@space = Space.find(params[:id])

			if @space.user_id == current_user.id
				# we good
			else 
				redirect_to root_path, notice: "Access Denied" 
			end
		end

end