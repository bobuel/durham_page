class TagAssignmentsController < ApplicationController
	before_filter :validate_admin

	def index
		@tag_assignments = TagAssignment.all
	end
end
