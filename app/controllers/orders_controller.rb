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
      @order.amount = params[id]
      @order.sum = @price * @order.amount
      @order.confirm = false
      @order.save
    end
    cookies.delete :cart
    redirect_to orders_show_path
  end

  def confirm_orders
    hash_number = Digest::SHA256.hexdigest (Time.now.to_i + rand(1000000)).to_s
    check = Check.new
    check.date = Date.today
    check.number = hash_number
    check.save
    @orders = Order.all.new_order.where({user_id: current_user.id})
    @orders.each do |order|
      order.update_attributes(:confirm => true, :number => hash_number)
    end
    OrderMailer.send_order(current_user, @orders).deliver
    redirect_to root_path, notice: 'Ваш заказ успешно подвержден'
  end
end
