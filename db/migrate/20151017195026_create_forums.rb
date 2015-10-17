class CreateForums < ActiveRecord::Migration
  def change
    create_table :forums do |t|
      t.integer :category_id

      t.timestamps null: false
    end
  end
end
