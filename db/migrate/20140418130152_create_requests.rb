class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
    	t.belongs_to :user
    	t.belongs_to :space
    	t.string :description
    	t.boolean :submitted 
    	t.boolean :viewed 
    	t.boolean :designed 
    	t.timestamps
    end
  end
end
