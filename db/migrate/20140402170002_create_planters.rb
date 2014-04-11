class CreatePlanters < ActiveRecord::Migration
  def change
    create_table :planters do |t|
    	t.string :name
    	t.integer :length_ft
        t.integer :length_inch
    	t.integer :width_ft
        t.integer :width_inch
    	t.integer :height_ft
        t.integer :height_inch
        t.integer :depth_ft
        t.integer :depth_inch
        t.integer :area_ft
        t.integer :area_inch
        t.integer :volume_ft
        t.integer :volume_inch
        t.integer :price_cents
    	t.text :description
    	t.timestamps
    end
  end
end
