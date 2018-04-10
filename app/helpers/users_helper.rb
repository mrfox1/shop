module UsersHelper
  def have_checks?
    if Check.find_by_user_id(current_user.id).present?
      true
    else
      false
    end
  end

  def count
    Check.all.where({user_id: current_user.id}).count
  end

  def users_check
    Check.find_by_user_id(current_user.id)
  end

  def users_confirm_order(check)
    Order.find_by_number(check)
  end

  def users_checks
    Check.all.where({user_id: current_user.id})
  end

  def users_confirm_orders(check)
      Order.all.where({user_id: current_user.id, number: check})
  end

  def product_name(id)
    Product.find(id).name
  end
end