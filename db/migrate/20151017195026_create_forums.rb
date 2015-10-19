class CreateForums < ActiveRecord::Migration
  def change
    create_table :forums do |t|
      t.string :name
      t.string :desc
      t.string :category_name
      t.string :icon

      t.timestamps null: false
    end
  end
end
