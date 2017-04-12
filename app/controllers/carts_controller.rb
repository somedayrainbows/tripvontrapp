class CartsController < ApplicationController
  include ActionView::Helpers::TextHelper

  def create
    experience = Experience.find(params[:experience_id])
    session[:cart] = @cart.contents
    flash[:notice] = "#{pluralize(@cart.count_of(experience.id), experience.title)} added to your cart."
    redirect_to experiences_path
  end

  def show
    @cart_experiences = @cart.cart_experiences
  end

  def update
    experience = Experience.find(params[:experience_id])
    @cart.add_experience(experience.id)
    session[:cart] = @cart.contents
    flash[:notice] = "#{pluralize(@cart.count_of(experience.id), experience.title)} added to your cart."
    redirect_to cart_path
  end
end
