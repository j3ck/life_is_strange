class CreateForums < ActiveRecord::Migration
  def change
    create_table :forums do |t|
      t.string :category_name

      t.timestamps null: false
    end
  end
end
