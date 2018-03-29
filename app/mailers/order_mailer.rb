class OrderMailer < ApplicationMailer
  default :from => 'admin@admin.com'

  def send_order(user ,orders)
    @user = user
    @order = orders
    mail(:to => @user.email, :subject => @order )
  end
end
