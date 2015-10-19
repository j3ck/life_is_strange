# == Schema Information
#
# Table name: themes
#
#  id         :integer          not null, primary key
#  name       :string
#  forum_id   :integer
#  user_id    :integer
#  pinned     :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Theme < ActiveRecord::Base

  # Находится в одном форуме
  belongs_to :forum

  # Имеет одного создателя
  belongs_to :user

  # Имеет множество сообщений
  has_many   :messages

  # Сначала выводим закреплённые темы
  scope :pin,   -> { where(pinned: true) }
  scope :unpin, -> { where(pinned: false) }

end
