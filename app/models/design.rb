class Design < ActiveRecord::Base
	# created for a request, space and user combination
	belongs_to :user
	belongs_to :space
	belongs_to :request 

	# comprised of many design_assignments 
	has_many :design_assignments, dependent: :destroy 
	has_many :design_plants, class_name: 'Plants', through: :design_assignments
	has_many :design_planters, class_name: 'Planters', through: :design_assignments 

	def toggle_reviewed
		self.reviewed = true
		save_model
	end 		

	def toggle_accepted
		self.accepted = true
		save_model
	end 

	def toggle_active 
		self.active = true 
		save_model
	end 

	protected 

		def save_model 
			if save
				true
			else
				false
			end
		end
end
