# == Schema Information
#
# Table name: checks
#
#  id         :integer          not null, primary key
#  date       :date
#  number     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class Check < ApplicationRecord
  has_many :orders

  validates_presence_of :date, :number
  validates_uniqueness_of :number
end
