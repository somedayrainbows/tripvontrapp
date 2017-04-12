class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    # @category = Category.find_by(name: params[:category_name])
    @category = Category.find(params[:id])

    @category = Category.find_by(slug: params[:category_slug])
  end

end
