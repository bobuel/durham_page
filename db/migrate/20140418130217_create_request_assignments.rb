class CreateRequestAssignments < ActiveRecord::Migration
  def change
    create_table :request_assignments do |t|
    	t.belongs_to :request_plant, class_name: 'Plant'
    	t.belongs_to :request
    	t.integer :quantity
    	t.integer :price_cents_when_requested
    	t.integer :price_cents_estimate 
        t.text :description
    	t.timestamps
    end
  end
end
