class CategoriesController < ApplicationController
  def index
     @categories = Category.all.sorted
  end

  def show
    @categories = Category.all.sorted
    category_id = params[:id]
    @products = ProductCategory.all.where({category_id: category_id})
    @products.page(params[:page])
  end
end
