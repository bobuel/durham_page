class Plant < ActiveRecord::Base

	attr_reader :price

	has_many :tag_assignments, dependent: :destroy
	has_many :tags, through: :tag_assignments

	has_many :request_assignments, dependent: :destroy, foreign_key: "request_plant_id"
	has_many :requests, through: :request_assignments

	has_many :design_assignments, dependent: :destroy, foreign_key: "design_plant_id"
	has_many :designs, through: :design_assignments
	
	validates :name, presence: true, uniqueness: true
	validates :description, presence: true
	
    validates :length_ft, presence: true, numericality: {only_integer: true, greater_than: 0 }
    validates :length_inch, numericality: {only_integer: true, greater_than: 0, less_than: 13 }

    validates :width_ft, presence: true, numericality: {only_integer: true, greater_than: 0 }
    validates :width_inch, numericality: {only_integer: true, greater_than: 0, less_than: 13 }

    validates :height_ft, presence: true, numericality: {only_integer: true, greater_than: 0 }
    validates :height_inch, numericality: {only_integer: true, greater_than: 0, less_than: 13 }


end
