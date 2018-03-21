class Concerns::CategoriesController < ApplicationController

  def show
    @category = Category.find(params[:id])
    #product_id = ProductCategory.all.where({category_id: category_id })
    #@products = Product.all.where({id: product_id})
  end
end
