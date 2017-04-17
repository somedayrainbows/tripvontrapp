class CategoriesController < ApplicationController
  def index
    @categories = Category.all.sample(7)
  end

  def show
    @category = Category.find_by_slug(params[:category_slug])
  end
end
