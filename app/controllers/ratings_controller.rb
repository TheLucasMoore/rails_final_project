class RatingsController < ApplicationController

  def new
    @rating = Rating.new
  end

  def create
    @rating = Rating.create(rating_params)
    redirect_to recipe_ratings_path
  end

  def index
    @recipe = Recipe.find(params[:recipe_id])
    @rating = @recipe.rating
  end

  private 

  def rating_params
    params.permit(:rating, :user_id, :recipe_id)
  end

end
