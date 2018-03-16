class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def find_product_in_cart(id)
    Product.find(id).name
  end

  def find_products_price_in_cart(id)
    Product.find(id).price
  end

  helper_method :current_user, :find_product_in_cart, :find_products_price_in_cart
end
