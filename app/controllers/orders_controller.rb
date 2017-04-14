class OrdersController < ApplicationController

  def index
    user = current_user
    if current_user
      @orders = user.orders
    else
      redirect_to "/login"
    end
  end

end
