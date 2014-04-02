class CreatePlanters < ActiveRecord::Migration
  def change
    create_table :planters do |t|
    	t.string :name
    	t.float :length
    	t.float :width
    	t.float :height
    	t.text :description
    	t.timestamps
    end
  end
end
