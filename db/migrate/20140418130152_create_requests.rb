class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
    	t.belongs_to :user
    	t.belongs_to :space
    	t.text :description
    	t.timestamps
    end
  end
end
