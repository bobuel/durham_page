class CreatePlants < ActiveRecord::Migration
  def change
    create_table :plants do |t|
    	t.string :name
    	t.float :length
    	t.float :width
    	t.float :height
    	t.float :area
    	t.float :volume
    	t.text :description
    	t.timestamps
    end
  end
end
