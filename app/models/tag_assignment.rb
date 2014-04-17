class TagAssignment < ActiveRecord::Base

	belongs_to :tag
	belongs_to :plant
	belongs_to :planter 

end
