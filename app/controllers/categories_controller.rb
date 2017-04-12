class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    byebug
    @category = Category.find_by(name: params[:category_name])
  end

end
