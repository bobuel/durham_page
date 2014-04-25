class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
    	t.belongs_to :user
    	t.belongs_to :space
    	t.string :description
    	t.boolean :submitted, default: false 
    	t.boolean :viewed, default: false 
    	t.boolean :designed, default: false 
    	t.timestamps
    end
  end
end
