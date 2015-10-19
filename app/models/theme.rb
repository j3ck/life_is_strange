# == Schema Information
#
# Table name: themes
#
#  id         :integer          not null, primary key
#  name       :string
#  forum_id   :integer
#  user_id    :integer
#  pinned     :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Theme < ActiveRecord::Base

  # Находится в одном форуме
  belongs_to :forum

  # Имеет множество сообщений
  has_many   :messages

end
