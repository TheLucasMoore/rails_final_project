class RecipeIngredientsController < ApplicationController

  def index
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_ingredients = @recipe.recipe_ingredients
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_ingredients = @recipe.recipe_ingredients
    @amount = params["/recipe_ingredients"][0].to_i
    @ingredient_id = params.keys[2].to_i

    RecipeIngredient.set_amount(@recipe.id, @ingredient_id, @amount)
    redirect_to recipe_path(@recipe)
  end

  def update
    raise params.inspect
    redirect_to recipe_path(@recipe)
  end

  def amount
    raise params.inspect
  end

  private

  def ri_params
    params.permit()
  end

end
