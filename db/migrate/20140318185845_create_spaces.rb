class CreateSpaces < ActiveRecord::Migration
  def change
    create_table :spaces do |t|
    	t.belongs_to :address
    	t.string :name
        t.integer :length_ft
        t.integer :length_inch
        t.integer :width_ft
        t.integer :width_inch
        t.integer :height_ft
        t.integer :height_inch
    	t.boolean :is_rooftop
    	t.boolean :is_ground
    	t.integer :floor
        t.text :description
    	t.timestamps
    end
  end
end
