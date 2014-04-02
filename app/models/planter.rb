class Planter < ActiveRecord::Base

    validates :name, presence: true
    validates :length, presence: true
    validates :width, presence: true
end
