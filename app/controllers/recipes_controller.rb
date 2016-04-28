class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
    @comment = Comment.new
  end

  def new
    @recipe = Recipe.new
  end

  def create
    #raise params.inspect
    @recipe = Recipe.create(recipe_params)
    @recipe.ingredients = params[:recipe][:ingredients]
    
    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      flash[:alert] = "There were issues saving your recipe."
      render :new
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      redirect_to recipe_path(@recipe)
    else
      flash[:alert] = "There were issues saving your recipe."
      render 'edit'
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path
  end

  private

  def recipe_params
    params.require(:recipe).permit(:user_id, :name, :rating, :description, :ingredients, :ingredients_attributes => [:name])
  end
end
