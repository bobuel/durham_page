class User < ActiveRecord::Base
	has_many :sessions
	has_many :addresses, dependent: :destroy
	has_many :spaces, through: :addresses

	# security 
	has_secure_password

	validates :user_email, uniqueness: true, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
	validates :user_first_name, presence: true
	validates :user_last_name, presence: true
end
