class AddressesController < ApplicationController
	before_filter :validate_access, except: [:new, :create, :index]

	def new 
		@address = Address.new
	end

	def create 
		@address = current_user.addresses.build(address_params)

		if @address.save
			redirect_to [current_user, @address], notice: 'Address Created'
		else
			render 'new'
		end
	end

	def show 
		@address = Address.includes(:spaces).find(params[:id])
	end

	def index
		@addresses = current_user.addresses
	end

	def edit 
		@address = Address.find(params[:id])
	end

	def update
		@address = Address.find(params[:id])

		if @address.update(address_params)
			redirect_to @address, notice: 'Update Successful'
		else
			render 'edit'
		end
	end

	def destroy
		@address = Address.find(params[:id])

		if @address.destroy
			redirect_to user_addresses_path(current_user), notice: "Destroy Successful"
		else
			redirect_to [current_user, @address], notice: "Destroy Unsuccessful"
		end
	end

	private

		def address_params
			params.require(:address).permit(:address_1, :address_2, :city, :state, :zip, :name, :user_id)
		end

		def validate_access
			@address = Address.find(params[:id])
			validate_user(@address)
		end
end
