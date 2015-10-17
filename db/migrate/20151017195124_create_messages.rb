class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :user_id
      t.integer :forum_id

      t.timestamps null: false
    end
  end
end
