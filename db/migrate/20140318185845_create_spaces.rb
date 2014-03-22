class CreateSpaces < ActiveRecord::Migration
  def change
    create_table :spaces do |t|
    	t.belongs_to :address
    	t.string :name
    	t.float :length
    	t.float :width
    	t.float :height
    	t.boolean :is_rooftop
    	t.boolean :is_ground
    	t.integer :floor
        t.text :description
    	t.timestamps
    end
  end
end
