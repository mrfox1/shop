# == Schema Information
#
# Table name: ancestor_descendant_categories
#
#  id          :integer          not null, primary key
#  category_id :integer
#  descendant  :integer
#  level       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe AncestorDescendantCategory, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
