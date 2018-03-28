class Comment < ApplicationRecord
  belongs_to :product
  belongs_to :user

  validates_presence_of :text
  validates :text, length: {maximum: 280}
end
