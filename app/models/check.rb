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

  validates :date, :number, presence: true
  validates :number, uniqueness: true
end
