class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :is_admin, null: false, default: 'false'
    	t.string :first_name, null: false
    	t.string :last_name, null: false
    	t.string :email, null: false
    	t.string :password_digest, null: false
    	t.boolean :is_active, null: false, default: true
    	t.timestamps
    end
  end
end
