class UsersController < ApplicationController

  def show
    user_id = params[:id]
    if user_id.to_i == current_user.id
      @user = User.find(user_id)
    else
      redirect_to root_path, notice: 'Вы не можете перейти на эту страницу'
    end
  end

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

  def update
    respond_to do |format|
      if @user.update(user_params)
        @user = User.find(params[:id])
        format.html { redirect_to @user, notice: 'Личные данные успешно отредактированы.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { redirect_to :back, notice: 'К сожалению произошла ошибка' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :sname, :email, :password, :phone, :country, :city,
                                 :street, :number, :appartament, :postindex, :role)
  end
end
