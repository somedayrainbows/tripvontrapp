class Admin::DashboardController < Admin::BaseController

  def index
    @pending_experiences = Experience.where(status: 'pending')
    if params[:status]
      @orders = Order.where(status: params[:status])
    else
      @orders = Order.all
    end
  end

end
