module ProductsHelper
  def count_assessments(product)
    product.assessments.count
  end
end
