class Address < ActiveRecord::Base

	has_many :spaces, dependent: :destroy

	validates :name, presence: true
	validates :address_1, presence: true
	validates :city, presence: true
	validates :state, presence: true
	validates :zip, presence: true
end
