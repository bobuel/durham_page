class RequestAssignment < ActiveRecord::Base
	belongs_to :request
	belongs_to :request_plant, class_name: 'Plant'

	def estimate_price_cents 
		quantity * price_cents_when_requested
	end

end
