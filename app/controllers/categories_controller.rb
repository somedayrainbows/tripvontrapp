class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    # @experience = Experience.find(params[:experience_id])
    # @category = @experience.categories.find(params[:id])
  end

end
