class CreateKeywords < ActiveRecord::Migration
  def change
    create_table :keywords do |t|
    	t.string :phrase, null: false
    	t.timestamps
    end
  end
end
