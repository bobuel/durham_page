class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :user_email
		t.string :user_first_name
		t.string :user_last_name
		t.string :password_digest 
		t.boolean :is_admin
		t.boolean :is_designer

      	t.timestamps
    end
  end
end
