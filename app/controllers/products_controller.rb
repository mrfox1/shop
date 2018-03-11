class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def add_to_cart
    product_id = params[:id]
    if cookies[:cart].present?
      products = cookies[:cart].split(',')
      products << product_id
      cookies[:cart] = products.join(',')
    else
      cookies[:cart] =product_id
    end
    redirect_to :back
  end
end
