class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.integer :user_id
      t.string :title
      t.string :desc
      t.text :content
      t.string :image

      t.timestamps null: false
    end
  end
end
