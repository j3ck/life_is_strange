# == Schema Information
#
# Table name: messages
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  forum_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Message < ActiveRecord::Base

  # Сообщение имеет одного владельца
  belongs_to :user

  # Сообщение находится в одной теме
  belongs_to :theme

end
