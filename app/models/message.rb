# == Schema Information
#
# Table name: messages
#
#  id         :integer          not null, primary key
#  content    :text
#  user_id    :integer
#  theme_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Message < ActiveRecord::Base

  # Сообщение имеет одного владельца
  belongs_to :user

  # Сообщение находится в одной теме
  belongs_to :theme

end
