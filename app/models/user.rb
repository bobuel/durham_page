class User < ActiveRecord::Base
	# session stores activity details
	has_many :sessions

	# addresses have spaces for planting 
	has_many :addresses, dependent: :destroy
	has_many :spaces, dependent: :destroy

	# submits requests 
	has_many :requests, dependent: :destroy

	# DESIGNER has designs
	   # These persist even if user destroyed 
	has_many :designs

	# DESIGNER has design assignments 
	   # These persist even if user destroyed 
	has_many :design_assigments

	# security 
	has_secure_password


	# validations
	validates :user_email, uniqueness: true, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
	validates :user_first_name, presence: true
	validates :user_last_name, presence: true

end
