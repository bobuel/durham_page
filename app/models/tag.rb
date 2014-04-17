class Tag < ActiveRecord::Base

	has_many :tag_assignments, dependent: :destroy
	has_many :plants, through: :tag_assignments
	has_many :planters, through: :tag_assignments

	validates :name, presence: true, uniqueness: true
	validates :description, presence: true 
end
