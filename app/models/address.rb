class Address < ActiveRecord::Base
	has_many :spaces, dependent: :destroy
	belongs_to :user

	validates :name, presence: true
	validates :address_1, presence: true
	validates :city, presence: true
	validates :state, presence: true
	validates :zip, presence: true, format: { with: /\A^\d{5}(-\d{4})?$\z/ }
end
