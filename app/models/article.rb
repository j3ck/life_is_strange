class Article < ActiveRecord::Base
  belongs_to :user
  mount_uploader :image, ImageUploader

  # TODO: необходимы валидации
end
