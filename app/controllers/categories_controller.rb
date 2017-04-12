class CategoriesController < ApplicationController
  def show
    @category = Category.find_by_slug(params[:category_slug])
  end
end
