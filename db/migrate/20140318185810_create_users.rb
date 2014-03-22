class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :user_email
		t.string :user_first_name
		t.string :user_last_name
		t.string :password_digest 

      	t.timestamps
    end
  end
end
