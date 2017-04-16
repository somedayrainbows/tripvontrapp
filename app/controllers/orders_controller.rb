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
    if user.admin?
      @order = Order.find(params[:id])
    else
      @order = user.orders.find(params[:id])
    end
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.update_attributes(status: params[:status])
    flash[:message] = "Status for order #{@order.id} was updated successfully."
    redirect_to admin_dashboard_index_path
  end


private

  def cart_reset
    session[:cart] = nil
  end
end
