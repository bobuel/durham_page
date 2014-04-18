class CreateRequestAssignments < ActiveRecord::Migration
  def change
    create_table :request_assignments do |t|
    	t.belongs_to :request_plant, class_name: 'Plant'
    	t.belongs_to :request
    	t.integer :quantity
    	t.integer :price_when_requested
    	t.integer :price_estimate 
    	t.timestamps
    end
  end
end
