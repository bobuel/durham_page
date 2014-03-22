class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
   		t.belongs_to :user
    	t.timestamp :log_in_time
    	t.timestamp :log_out_time
    	t.integer :duration_seconds
      	t.timestamps
    end
  end
end
