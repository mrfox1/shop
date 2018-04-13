# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  text       :string
#  product_id :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Comment < ApplicationRecord
  belongs_to :product
  belongs_to :user

  validates :text, :user_id, presence: true
  validates :text, length: {maximum: 280}
end
