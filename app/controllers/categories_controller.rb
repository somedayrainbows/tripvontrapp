class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
<<<<<<< HEAD
  
=======
    @category = Category.find_by_slug(params[:category_slug])
>>>>>>> master
  end

end
