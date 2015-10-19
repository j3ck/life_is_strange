class CreateThemes < ActiveRecord::Migration
  def change
    create_table :themes do |t|
      t.string :name
      t.integer :forum_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
