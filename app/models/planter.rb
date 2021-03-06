class Planter < ActiveRecord::Base

	has_many :tag_assignments, dependent: :destroy
	has_many :tags, through: :tag_assignments

    has_many :design_assignments, dependent: :destroy, foreign_key: 'design_planter_id'
    has_many :designs, through: :design_assignments

    validates :name, presence: true

    validates :length_ft, presence: true, numericality: {only_integer: true, greater_than: 0 }
    validates :length_inch, numericality: {only_integer: true, greater_than: 0, less_than: 13 }, allow_blank: true

    validates :width_ft, presence: true, numericality: {only_integer: true, greater_than: 0 }
    validates :width_inch, numericality: {only_integer: true, greater_than: 0, less_than: 13 }, allow_blank: true

    validates :height_ft, presence: true, numericality: {only_integer: true, greater_than: 0 }
    validates :height_inch, numericality: {only_integer: true, greater_than: 0, less_than: 13 }, allow_blank: true

    validates :depth_ft, presence: true, numericality: {only_integer: true, greater_than: 0 }
    validates :depth_inch, numericality: {only_integer: true, greater_than: 0, less_than: 13 }, allow_blank: true
end
