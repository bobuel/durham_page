class DesignAssignment < ActiveRecord::Base
	belongs_to :design_plant, class_name: 'Plant'
	belongs_to :design_planter, class_name: 'Planter'
	belongs_to :design
	belongs_to :user # desgining user 
end
