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

  def show_cart
    if cookies[:cart].present?
      index = cookies[:cart].split(',')
      index.each do |product|
        @products_in_cart = @products_in_cart.to_a + Product.find(product).name.split(',')
        @prices_in_cart = @prices_in_cart.to_a + Product.find(product).price.to_s.split(',')
        @sum = @sum.to_f + Product.find(product).price
      end
      @count_of_products = cookies[:cart].split(',').size
    else
      @count_of_products = 0
    end
  end
end
