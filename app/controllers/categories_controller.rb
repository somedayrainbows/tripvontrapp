class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    # @category = Category.find_by(name: params[:category_name])
    # @category = Category.find(params[:id])

    @category = Category.find(slug: params[:id])
    # @category = Category.find_by_slug(params[:id])
  end

end
