class Request < ActiveRecord::Base
	# made by user 
	belongs_to :user
	belongs_to :space 

	# request assignments track user plant requests
	has_many :request_assignments, dependent: :destroy
	has_many :request_plants, class_name: 'Plant', through: :request_assignments

	# designs are made from requests 
	has_many :designs, dependent: :destroy

	# validations
	validates :user_id, presence: true 
	validates :space_id, presence: true 
	validates :description, presence: true

	scope :all_submitted, -> {where(submitted: true)}
	
	def toggle_submitted
		self.submitted = true
		if save 
			true
		else
			false 
		end
	end

	def toggle_viewed
		self.viewed = true
		if save
			true
		else
			false
		end
	end

	def toggle_designed
		self.designed = true
		if save
			true
		else
			false
		end
	end

	def estimate_price_cents 
		estimated_price_cents = 0 
		request_assignments.each do |request_assignment|
			estimated_price_cents += request_assignment.request_plant.price_cents
		end
		return estimated_price_cents
	end

end
