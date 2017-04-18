class ExperiencesController < ApplicationController

  def index
    @experiences = Experience.where.not(status: 'pending').sample(100)
  end

  def show
    @experience = Experience.find(params[:id])
  end

  def new
    @categories = Category.all
    @experience = Experience.new
  end

  def create
    @categories = Category.all
    @experience = Experience.new(experience_params)
    if @experience.save
      flash[:success] = "#{@experience.title} has been successfully created."
      redirect_to experience_path(@experience)
    else
      render :new
    end

  def destroy
    
  end
  end

private
  def experience_params
    params.require(:experience).permit(:title, :description, :city, :status,
                                       :cost, :photo, category_ids: [])
  end
end
