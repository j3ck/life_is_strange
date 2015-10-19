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
end
