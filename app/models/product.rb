# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  price       :decimal(8, 2)    default(0.0)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  image       :string
#  rating      :float
#

class Product < ApplicationRecord
  include PgSearch
  pg_search_scope :search_everywhere, against: [:name, :description]

  paginates_per 8

  scope :best, -> { where('rating >= 4.5')}

  has_many :product_categories
  has_many :categories, through: :product_categories
  has_many :comments
  has_many :assessments

  validates :name, :price, presence: true
  validates :name, uniqueness: true

  mount_uploader :image, ProductImageUploader
end
