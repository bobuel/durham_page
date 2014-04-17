class Space < ActiveRecord::Base
	belongs_to :address
    belongs_to :user

	# Validations 
    validates :address_id, presence: true
    validates :user_id, presence: true 
    validates :name, presence: true
    
    validates :length_ft, presence: true, numericality: {only_integer: true, greater_than: 0 }
    validates :length_inch, numericality: {only_integer: true, greater_than: 0, less_than: 13 }

    validates :width_ft, presence: true, numericality: {only_integer: true, greater_than: 0 }
    validates :width_inch, numericality: {only_integer: true, greater_than: 0, less_than: 13 }

    validates :height_ft, presence: true, numericality: {only_integer: true, greater_than: 0 }
    validates :height_inch, numericality: {only_integer: true, greater_than: 0, less_than: 13 }

    validates :floor, presence: true 
    validates :description, presence: true
end
