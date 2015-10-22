class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :role, default: 'user'
      t.string :name
      t.string :real_name
      t.string :slack_user_id
      t.string :photo_url
      t.float  :gold, default: 0.0
      t.string :job, default: 'Свободная касса!'

      t.string :blog_name, default: 'Измени меня'
      t.string :blog_desc, default: ' На странице настроек =)'
      t.string :blog_image, default: '/back.jpg'

      t.string :forum_about_text, default: 'Измени меня в настройках =)'

      t.timestamps null: false
    end
  end
end
