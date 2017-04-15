class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:success] = "Logged in as #{@user.name}. Welcome!"

      redirect_to dashboard_path if current_user.admin? == false 

      redirect_to admin_dashboard_index_path if current_user.admin?

    else
      flash[:danger] = "Invalid user/password combination."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You have logged out successfully."
    redirect_to login_path
  end
end
