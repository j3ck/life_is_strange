# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  provider   :string(255)
#  uid        :string(255)
#  photo_url  :string(255)
#  gold       :float(24)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base

  has_many :articles

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
