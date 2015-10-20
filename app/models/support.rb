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

  # Валидации
  validates :name, :email, :message, presence: true
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates :name, :email, :desc, length: { maximum: 30 }
  validates :message, length: { maximum: 1000 }

end
