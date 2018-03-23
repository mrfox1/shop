class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.role = 'user'
    if @user.save
      redirect_to :back
      current_user
    else
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :sname, :email, :password, :phone, :country, :city,
                                 :street, :number, :appartament, :postindex, :role)
  end
end
