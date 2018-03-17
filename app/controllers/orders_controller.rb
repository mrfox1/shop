class OrdersController < ApplicationController
  def index
    @orders = Order.all
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
      @order.sum = @price.to_d * @order.amount
      @order.save!
    end
    redirect_to root_path
  end

end
