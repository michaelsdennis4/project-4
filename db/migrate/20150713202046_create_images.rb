class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
    	t.integer :item_id, null: false
    	t.string :url, null: false
    	t.string :caption
    	t.timestamps
    end
  end
end
