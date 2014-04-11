class Plant < ActiveRecord::Base
	validates :name, presence: true, uniqueness: true
	validates :description, presence: true
	validates :length, presence: true
	validates :width, presence: true
	validates :height, presence: true 
end
