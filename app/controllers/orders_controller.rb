class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @date = Date.today
    @orders = Order.all.new_order.where({user_id: current_user.id})
    @orders.each do |order|
      @sum = @sum.to_f + order.sum
    end
  end

  def new
    @order = Order.new
  end

  def create
    cookies[:cart].split(',').each do |id|
      @order = Order.new
      @price = Product.find(id).price
      @order.date = Date.today
      @order.product_id = id
      @order.user_id = current_user.id
      @order.amount = 1
      @order.sum = @price * @order.amount
      @order.confirm = false
      @order.save!
    end
    cookies.delete :cart
    redirect_to orders_show_path
  end

  def confirm_orders
    @orders = Order.all.new_order.where({user_id: current_user.id})
    @orders.each do |order|
      order.update_attributes(:confirm => true)
    end
    redirect_to root_path, notice: 'Ваш заказ успешно подвержден'
  end
end
