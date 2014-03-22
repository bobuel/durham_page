class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
    	t.belongs_to :user
    	t.string :address_1
    	t.string :address_2
    	t.string :city
    	t.string :state
    	t.integer :zip
    	t.timestamps
    end
  end
end
