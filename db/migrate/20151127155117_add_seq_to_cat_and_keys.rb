class AddSeqToCatAndKeys < ActiveRecord::Migration
  def change
  	add_column :categories, :sequence, :integer
  	add_column :keywords, :sequence, :integer
  end
end
