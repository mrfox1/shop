# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  date       :date
#  product_id :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  amount     :integer
#  sum        :decimal(, )
#

class Order < ApplicationRecord
  has_many :products
  belongs_to :user
end
