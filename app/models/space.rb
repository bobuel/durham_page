class Space < ActiveRecord::Base
	belongs_to :address
	belongs_to :user, through: :address

	# Validations 
    validates :address_id, presence: true
    validates :name, presence: true
    validates :length, presence: true
    validates :width, presence: true
    validates :height, presence: true
    validates :floor, presence: true 
    validates :description, presence: true
end
