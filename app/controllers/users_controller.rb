class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    flash[:success] = "Logged in as #{@user.name}. Welcome!"
    redirect_to dashboard_path
  end

  def show
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
