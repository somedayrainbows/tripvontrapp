class OrdersController < ApplicationController

  # after_create :cart_reset

  def index
    user = current_user
    if current_user
      @orders = user.orders
    else
      redirect_to "/login"
    end
  end

def create
  @order = Order.create(total_price: @cart.total, user_id: current_user.id)
  @order.add_experience_to_order(@cart)
  flash[:success] = "Order was successfully placed."
  cart_reset
  redirect_to orders_path
end

  def show
    user = current_user
    @order = user.orders.find(params[:id])
  end


private

  def cart_reset
    session[:cart] = nil
  end
end
