class CreateNewImagesTable < ActiveRecord::Migration
  def change
    create_table :images do |t|
    	t.integer :item_id, null: false
    	t.string :image_uid
    	t.string :caption
    	t.timestamps
    end
  end
end
