class ExperiencesController < ApplicationController


  def index
    @experiences = Experience.all
    # @cart = Cart.new(session[:cart]) this now lives in applicaiton Controller
  end
end
