class CreateTagAssignments < ActiveRecord::Migration
  def change
    create_table :tag_assignments do |t|
    	t.belongs_to :tag
    	t.belongs_to :plant
    	t.belongs_to :planter 
    	t.string :note
    	t.timestamps
    end

    add_index :tag_assignments, [:tag_id, :plant_id, :planter_id], unique: true
  end
end
