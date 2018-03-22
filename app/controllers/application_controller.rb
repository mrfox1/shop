class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def find_products(id)
    Product.find(id).name
  end

  def find_products_price(id)
    Product.find(id).price
  end

  def find_category(id)
    Category.find(id).name
  end

  helper_method :current_user, :find_products, :find_products_price, :find_category
end
