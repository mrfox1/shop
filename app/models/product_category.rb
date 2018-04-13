# == Schema Information
#
# Table name: product_categories
#
#  id          :integer          not null, primary key
#  product_id  :integer
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class ProductCategory < ApplicationRecord
  belongs_to :product
  belongs_to :category

  validates :product_id, :category_id, presence: true
end
