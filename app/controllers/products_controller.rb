class ProductsController < ApplicationController
  def index
    @products = Product.all
    @categories = Category.all.sorted
  end

  def add_to_cart
    product_id = params[:id]
    if cookies[:cart].present? == false
      cookies[:cart] =product_id
    end
    if can_add_to_cart?
      products = cookies[:cart].split(',')
      products << product_id
      cookies[:cart] = products.join(',')
    end
    redirect_to root_path
  end

  def show_cart
    if cookies[:cart].present?
      cookies[:cart].split(',').each do |product|
        @sum = @sum.to_f + Product.find(product).price
      end
      @count_of_products = cookies[:cart].split(',').size
    else
      @count_of_products = 0
    end
  end

  def clear_cart
    cookies.delete :cart
    redirect_to root_path
  end

  def can_add_to_cart?
    if cookies[:cart].present? && cookies[:cart].split(',').include?(params[:id])
      false
    else
      true
    end
  end
end
