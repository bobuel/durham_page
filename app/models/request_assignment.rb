class RequestAssignment < ActiveRecord::Base
	belongs_to :request
	belongs_to :request_plant, class_name: 'Plant'

	def set_price_cents_when_requested (price)
		self.price_cents_when_requested = price
		save
	end

	def estimate_price_cents 
		quantity ||= 0
		price_cents_when_requested ||= 0
		quantity * price_cents_when_requested
	end

end
