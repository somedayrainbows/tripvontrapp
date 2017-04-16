class HomeController < ApplicationController

  def index
    @random_experiences = Experience.all.sample(6)
  end

end
