class CreateJoinItemsKeywords < ActiveRecord::Migration
  def change
    create_join_table :items, :keywords do |t|
    	t.index :item_id
    	t.index :keyword_id
    end
  end
end
