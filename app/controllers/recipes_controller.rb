class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
    @comment = Comment.new
    @recipe_comments = @recipe.comments
    @recipe_ingredients = @recipe.recipe_ingredients

    respond_to do |format|
      format.html {render :show}
      format.json {render json:@recipe}
    end
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.create(recipe_params)
    @recipe.ingredients = params[:recipe][:ingredient_ids]
    
    if @recipe.save
      redirect_to recipe_recipe_ingredients_path(@recipe)
    else
      message = @recipe.errors.full_messages
      flash[:alert] = message
      render :new
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
    @recipe_ingredients = RecipeIngredient.where(:recipe_id => params[:id])
    authorize @recipe
  end

  def update
    @recipe = Recipe.find(params[:id])
    authorize @recipe
    @recipe.update(recipe_params)

    if @recipe.save
      redirect_to recipe_recipe_ingredients_path(@recipe)
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

  def search
  end

  def results
    term = params["search"]
    recipe = Recipe.find_recipe(term)
    redirect_to recipe_path(recipe)
  end

  private

  def recipe_params
    params.require(:recipe).permit(:user_id, :name, :rating, :description, :ingredient_ids => [], :ingredients_attributes => [:name])
  end
end
