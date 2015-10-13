class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :provider
      t.string :uid
      t.string :photo_url
      t.float :gold

      t.string :blog_name
      t.string :blog_desc

      t.timestamps null: false
    end
  end
end
