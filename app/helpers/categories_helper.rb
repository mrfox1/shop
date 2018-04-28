module CategoriesHelper

  def ancestor?(category)
    category.hasAncestor == false
  end

  def descendant?(category)
    category.hasDescendands == true
  end

  def print_descendants(category)
    DescendantCategory.all.where({parent: category.id})
  end
end
