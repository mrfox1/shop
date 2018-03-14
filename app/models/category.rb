# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string
#  position   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Category < ApplicationRecord
  acts_as_list

  has_many :product_categories
  has_many :products, through: :product_categories

  scope :sorted, -> {order(:position)}
end
