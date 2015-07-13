class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
    	t.string :code
    	t.string :caption, null: false
    	t.string :description
    	t.integer :purchase_price
    	t.integer :selling_price
    	t.boolean :is_available, null: false, default: 'true'
    	t.string :condition
    	t.string :measurements
    	t.date :date_acquired
    	t.date :date_sold
    	t.timestamps
    end
  end
end
