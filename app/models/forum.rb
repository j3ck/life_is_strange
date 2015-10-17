# == Schema Information
#
# Table name: forums
#
#  id          :integer          not null, primary key
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Forum < ActiveRecord::Base
end
