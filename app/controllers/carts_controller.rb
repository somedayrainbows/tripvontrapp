class CartsController < ApplicationController
  include ActionView::Helpers::TextHelper

  def create
    experience = Experience.find(params[:experience_id])
    @cart.add_experience(experience.id)
    session[:cart] = @cart.contents
    flash[:notice] = "#{pluralize(@cart.count_of(experience.id), experience.title)} added to your cart."
    redirect_to experiences_path
  end

  def show
    @cart_experiences = @cart.cart_experiences
  end

  def update
    type = params[:type]
    experience = Experience.find(params[:experience_id])
    if type == "increase"
      @cart.add_experience(experience.id)
      session[:cart] = @cart.contents
    elsif type == "decrease"
      @cart.subtract_experience(experience.id)
      session[:cart] = @cart.contents
    end
    redirect_back(fallback_location: cart_path)
  end

  def remove
    experience= Experience.find(params[:experience_id])
    @cart.remove_experience(params[:experience_id])
    # flash[:notice] = "Successfully removed <a href='/experience/#{experience.id}' > #{experience.title}</a> from your cart."
    # flash[:notice] = link_to(experience.title, experiences_path(experience.id))
    redirect_to cart_path
  end
end
