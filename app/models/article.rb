# == Schema Information
#
# Table name: articles
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  title      :string
#  desc       :string
#  content    :text
#  image      :string
#  slug       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Article < ActiveRecord::Base
  extend FriendlyId

  # Опимизируем систему для того, чтобы она понимала русский язык, зараза
  def normalize_friendly_id(text)
    text.to_slug.normalize(transliterations: :russian).to_s
  end

  # Множество записей у одного пользователя
  belongs_to :user

  # Ищем по заголовкам, а не по id
  friendly_id :title, use: :slugged

  # Используем carrierwave для загрузки изобраения к записи в блоге
  mount_uploader :image, ImageUploader

  # TODO: необходимы валидации

end
