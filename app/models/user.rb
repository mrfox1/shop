# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  sname           :string
#  email           :string
#  password_digest :string
#  phone           :string
#  country         :string
#  city            :string
#  street          :string
#  number          :integer
#  appartament     :integer
#  postindex       :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  role            :string
#

class User < ApplicationRecord
  has_secure_password

  has_many :orders
  has_many :comments

  validates :password_digest, length:{minimum: 6}
  validates_uniqueness_of :email
end
