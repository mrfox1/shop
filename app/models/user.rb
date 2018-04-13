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
#  image           :string
#

class User < ApplicationRecord
  has_secure_password

  has_many :orders
  has_many :comments
  has_many :assessments

  validates :password_digest, length:{minimum: 6}
  validates :email, uniqueness: true
  validates :name, :sname, :email, :password_digest, presence: true

  mount_uploader :image, UsersAvatarUploader
end
