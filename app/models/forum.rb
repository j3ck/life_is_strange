# == Schema Information
#
# Table name: forums
#
#  id            :integer          not null, primary key
#  name          :string
#  category_name :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Forum < ActiveRecord::Base

  # Имеет одну категорию
  belongs_to :category

  # Имеет множество сообщений в себе (в форуме)
  has_many   :messages

  # Готовые выборки по категориям
  scope :society, -> { where(name: 'society') }

end
