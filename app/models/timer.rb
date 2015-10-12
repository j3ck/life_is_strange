# == Schema Information
#
# Table name: timers
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  name       :string(255)
#  status     :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Timer < ActiveRecord::Base
  belongs_to :user
end
