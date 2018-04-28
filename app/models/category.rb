# == Schema Information
#
# Table name: categories
#
#  id             :integer          not null, primary key
#  name           :string
#  position       :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  hasDescendands :boolean
#  hasAncestor    :boolean
#

class Category < ApplicationRecord
  acts_as_list

  has_many :product_categories
  has_many :products, through: :product_categories

  validates :name, :position, presence: true
  validates :name, uniqueness: true

  scope :sorted, -> {order(:position)}
end
