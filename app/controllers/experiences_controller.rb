class ExperiencesController < ApplicationController

  def index
    @experiences = Experience.all.sample(100)
  end

  def show
    @experience = Experience.find(params[:id])
  end

end
