# == Schema Information
#
# Table name: assessments
#
#  id         :integer          not null, primary key
#  product_id :integer
#  user_id    :integer
#  value      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Assessment < ApplicationRecord
  belongs_to :product
  belongs_to :user

  validates_presence_of :user_id, :product_id, :value
  validates_numericality_of :value, :greater_than => 0, :less_than => 6
end
