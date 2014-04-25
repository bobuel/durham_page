class Design < ActiveRecord::Base
	# created for a request, space and user combination
	belongs_to :user
	belongs_to :space
	belongs_to :request 


end
