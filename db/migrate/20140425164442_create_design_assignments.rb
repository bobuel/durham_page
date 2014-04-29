class CreateDesignAssignments < ActiveRecord::Migration
  def change
    create_table :design_assignments do |t|
    	t.belongs_to :design
    	t.belongs_to :design_plant, class_name: 'Plant' 
    	t.belongs_to :design_planter, class_name: 'Planter'
    	t.belongs_to :user # desgining user 
    	t.boolean :included
    	t.integer :quantity
    	t.string :description
    	t.text :comments
    	t.timestamps
    end
  end
end
