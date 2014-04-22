class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
    	t.belongs_to :user
    	t.belongs_to :space
    	t.string :description
    	t.timestamps
    end
  end
end
