class CartsController < ApplicationController
  include ActionView::Helpers::TextHelper


  def index
    @cart_contents = @cart.contents
  end

  def create
    experience = Experience.find(params[:experience_id])

    @cart.add_experience(experience.id)
    session[:cart] = @cart.contents

    redirect_to cart_path
  end

end
