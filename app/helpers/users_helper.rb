module UsersHelper
  def count
    Check.all.where({user_id: current_user.id}).count
  end

  def users_checks
    Check.all.where({user_id: current_user.id})
  end

  def users_confirm_orders(check)
    Order.all.where({user_id: current_user.id, number: check})
  end

  def orders?
    Order.all.where({user_id: current_user.id, confirm: false}).present?
  end

  def ordercount
    Order.all.where({user_id: current_user.id, confirm: false})
  end
end