# == Schema Information
#
# Table name: users
#
#  id               :integer          not null, primary key
#  name             :string
#  provider         :string
#  uid              :string
#  photo_url        :string
#  gold             :float
#  job              :string           default("Свободная касса!")
#  blog_name        :string           default("Измени меня")
#  blog_desc        :string           default(" На странице настроек =)")
#  blog_image       :string           default("/back.jpg")
#  forum_about_text :string           default("Измени меня в настройках =)")
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class User < ActiveRecord::Base

  # Имеет множество записей в блоге
  has_many :articles

  # Имеет множество начатых тем на форуме
  has_many :themes

  # Имеет множество сообщений на форуме
  has_many :messages

  # Имеет множество сообщений на фоорумах
  has_many :messages

  # Мы либо находим пользователя в базе по данным :provider и :uid,
  # либо создаём (через метод first_or_create) и тут же обновляем
  # Потом отдаём то что получилось
  def self.find_or_create_from_auth_hash(auth_hash)
    user = where(provider: auth_hash[:provider], uid: auth_hash[:uid]).first_or_create

      if auth_hash[:provider] == 'googleplus'
        user.update(name: auth_hash[:info][:name])
      end

      if auth_hash[:provider] == 'vkontakte'
        user.update(name: auth_hash[:info][:name])
      end

      if auth_hash[:provider] == 'facebook'
        user.update(name: auth_hash[:info][:name])
      end

      if auth_hash[:provider] == 'github'
        user.update(name: auth_hash[:info][:name])
      end

      if auth_hash[:provider] == 'soundcloud'
        user.update(name: auth_hash[:info][:name])
      end

      if auth_hash[:provider] == 'twitter'
        user.update(name: auth_hash[:info][:nickname], photo_url: auth_hash[:info][:image])
      end
    user
  end

end
