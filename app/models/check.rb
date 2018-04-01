# == Schema Information
#
# Table name: checks
#
#  id         :integer          not null, primary key
#  date       :date
#  number     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Check < ApplicationRecord
  has_many :orders
end
