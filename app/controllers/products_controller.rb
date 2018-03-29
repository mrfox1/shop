class ProductsController < ApplicationController
  def index
    @products = Product.page(params[:page])
    @categories = Category.all.sorted
  end

  def new
    @product = Product.new
  end

  def show
    @product = Product.find(params[:id])
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

  def vote
    if current_user && can_user_vote?
      case params[:vote]
        when '1'
          value = 1
        when '2'
          value = 2
        when '3'
          value = 3
        when '4'
          value = 4
        when '5'
          value = 5
      end
      @product = Product.find(params[:id])
      assessment = Assessment.new
      assessment.user = current_user
      assessment.product = @product
      assessment.value = value
      assessment.save
    else redirect_to :back, notice: 'Вы не можете поставить оценку'
    end
  end

  private

  def can_user_vote?
    @rated_by = Assessment.where(user_id: current_user.id, product_id: params[:id])
    @rated_by.blank?
  end
end
