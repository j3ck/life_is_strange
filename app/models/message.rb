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

  belongs_to :user
  belongs_to :forum

end
