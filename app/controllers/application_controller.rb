class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def find_products(id)
    Product.find(id)
  end

  def find_category(id)
    Category.find(id).name
  end

  def checks?
    Check.find_by(user_id: current_user.id).present?
  end

  def users_check
    Check.find_by(user_id: current_user.id)
  end

  def users_confirm_order(check)
    Order.find_by(number: check)
  end

  def product_name(id)
    Product.find(id).name
  end

  helper_method :current_user, :find_products, :find_category, :checks?,
                :users_check, :users_confirm_order, :product_name


  FindRatingWorker.perform_at(Date.tomorrow.midnight)
end
