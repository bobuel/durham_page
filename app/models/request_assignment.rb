class RequestAssignment < ActiveRecord::Base
	belongs_to :request
	belongs_to :request_plant, class_name: 'Plant'

end
