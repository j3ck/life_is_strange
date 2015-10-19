# == Schema Information
#
# Table name: forums
#
#  id            :integer          not null, primary key
#  name          :string
#  desc          :string
#  category_name :string
#  icon          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Forum < ActiveRecord::Base

  # Имеет множество тем
  has_many   :themes

  # Готовые выборки по категориям
  scope :society, -> { where(category_name: 'society') }
  scope :science, -> { where(category_name: 'science') }

end
