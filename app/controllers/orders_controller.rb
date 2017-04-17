class OrdersController < ApplicationController
  # after_create :cart_reset

  def index
    if current_user
      @orders = current_user.orders
    else
      redirect_to "/login"
    end
  end

  def create
    @order = current_user.orders.create(total_price: @cart.total)
    @order.add_experience_to_order(@cart)
    flash[:success] = "Order was successfully placed."
    cart_reset
    redirect_to orders_path
  end

  def show
    if current_user.admin?
      @order = Order.find(params[:id])
    else
      @order = current_user.orders.find(params[:id])
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
