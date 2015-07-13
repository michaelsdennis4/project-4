class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :type, null: false, default: 'admin'
    	t.string :first_name, null: false
    	t.string :last_name, null: false
    	t.string :email, null: false
    	t.string :password_digest, null: false
    	t.boolean :is_active, null: false, default: true
    	t.timestamps
    end
  end
end
