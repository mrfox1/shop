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

require 'rails_helper'

RSpec.describe DescendantCategory, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
