class Plant < ActiveRecord::Base
	before_create :set_area_volume 


	def set_area_volume
		self.area = length * width
		self.volume = area * height
	end 

	validates :name, presence: true, uniqueness: true
	validates :description, presence: true
	validates :length, presence: true
	validates :width, presence: true
	validates :height, presence: true 
end
