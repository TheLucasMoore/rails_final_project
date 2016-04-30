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
    @recipe = Recipe.create(recipe_params)
    @recipe.ingredients = params[:recipe][:ingredient_ids]
    
    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      message = @recipe.errors.full_messages
      flash[:alert] = message
      render :new
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
    authorize @recipe
  end

  def update
    @recipe = Recipe.find(params[:id])
    authorize @recipe
    @recipe.update(recipe_params)

    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      message = @recipe.errors.full_messages
      flash[:alert] = message
      render :edit
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    authorize @recipe
    @recipe.destroy
    redirect_to recipes_path
  end

  private

  def recipe_params
    params.require(:recipe).permit(:user_id, :name, :rating, :description, :ingredient_ids => [], :ingredients_attributes => [:name])
  end
end
