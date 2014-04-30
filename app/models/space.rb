class Space < ActiveRecord::Base
	belongs_to :address
    belongs_to :user

    # request and designs are made for spaces 
    has_many :requests, dependent: :destroy 
    has_many :designs, dependent: :destroy 

	# Validations 
    validates :address_id, presence: true
    validates :user_id, presence: true 
    validates :name, presence: true
    
    validates :length_ft, presence: true, numericality: {only_integer: true, greater_than: 0 }
    validates :length_inch, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than: 13 }, allow_blank: true 

    validates :width_ft, presence: true, numericality: {only_integer: true, greater_than: 0 }
    validates :width_inch, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than: 13 }, allow_blank: true 

    validates :height_ft, presence: true, numericality: {only_integer: true, greater_than: 0 }
    validates :height_inch, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than: 13 }, allow_blank: true 

    validates :floor, presence: true 
    validates :description, presence: true

end
