class OrdersController < ApplicationController

  def index
    user = current_user
    if current_user
      @orders = user.orders
    else
      redirect_to "/login"
    end
  end



  def show
    user = current_user
    @order = user.orders.find(params[:id])
  end

end
