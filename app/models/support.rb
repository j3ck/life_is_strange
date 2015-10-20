# == Schema Information
#
# Table name: supports
#
#  id         :integer          not null, primary key
#  name       :string
#  email      :string
#  message    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Support < ActiveRecord::Base
end
