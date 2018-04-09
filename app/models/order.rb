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
#  confirm    :boolean
#  number     :string
#

class Order < ApplicationRecord
  belongs_to :user

  scope :new_order, -> {Order.where({date: Date.today})}
end
