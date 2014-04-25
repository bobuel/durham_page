class Request < ActiveRecord::Base

	# made by user 
	belongs_to :user
	belongs_to :space 

	# request assignments track user plant requests
	has_many :request_assignments, dependent: :destroy
	has_many :request_plants, class_name: 'Plant', through: :request_assignments

	validates :user_id, presence: true 
	validates :space_id, presence: true 
	validates :description, presence: true
	
	def toggle_submit 
		self.submitted = true
		if update
			true
		else
			false 
		end
	end

	def toggle_viewed 
		self.viewed = true
		save
	end

	def toggle_designed
		self.designed = true
		save
	end

	def set_new_bools 
		self.submitted = false 
		self.viewed = false
		self.designed = false 
		update
	end

	def estimate_price_cents 
		estmimated_price_cents = 0 
		self.request_assignments.each do |request_assignment|
			estimated_price_cents += request_assignment.estimate_price_cents 
		end
		return estimated_price_cents
	end

end
