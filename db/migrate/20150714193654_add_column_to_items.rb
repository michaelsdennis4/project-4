class AddColumnToItems < ActiveRecord::Migration
  def change
  	add_column :items, :thumb_image_id, :integer
  end
end
