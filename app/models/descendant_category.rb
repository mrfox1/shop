# == Schema Information
#
# Table name: descendant_categories
#
#  id          :integer          not null, primary key
#  parent      :integer
#  category_id :integer
#  level       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class DescendantCategory < ApplicationRecord
  belongs_to :category
end
