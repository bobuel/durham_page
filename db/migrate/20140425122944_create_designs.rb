class CreateDesigns < ActiveRecord::Migration
  def change
    create_table :designs do |t|
    	t.belongs_to :user
    	t.belongs_to :space
    	t.belongs_to :request
    	t.string :description
    	t.text :comments 
    	t.integer :price_cents
    	t.boolean :reviewed, default: false
    	t.boolean :accepted, default: false
    	t.boolean :active , default: false 
    	t.timestamps
    end
  end
end
