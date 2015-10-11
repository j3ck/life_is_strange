# == Schema Information
#
# Table name: timers
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  name       :string
#  status     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Timer < ActiveRecord::Base
  belongs_to :user
end
