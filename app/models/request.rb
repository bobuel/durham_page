class Request < ActiveRecord::Base
	before_save :set_values 

	# made by user 
	belongs_to :user
	belongs_to :space 

	# request assignments track user plant requests
	has_many :request_assignments, dependent: :destroy
	has_many :request_plants, class_name: 'Plant', through: :request_assignments

	validates :user_id, presence: true 
	validates :space_id, presence: true 

end
