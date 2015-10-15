class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :provider
      t.string :uid
      t.string :photo_url
      t.float :gold
      t.string :job, default: 'Свободная касса!'

      t.string :blog_name, default: 'Измени меня'
      t.string :blog_desc, default: ' На странице настроек =)'
      t.string :blog_image, default: '/back.jpg'

      t.timestamps null: false
    end
  end
end
