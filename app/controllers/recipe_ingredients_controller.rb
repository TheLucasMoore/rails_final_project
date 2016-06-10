class RecipeIngredientsController < ApplicationController

  def index
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_ingredients = @recipe.recipe_ingredients
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_ingredients = @recipe.recipe_ingredients

    # @amount = params["/recipe_ingredients"].values[0].to_i
    @ingredient_id = params["ingredient_id"]
    @quantity = params["/recipe_ingredients"].values[0].to_i

    setter = RecipeIngredient.set_amount(@recipe.id, @ingredient_id, @quantity)
    redirect_to recipe_path(@recipe)
  end

  # def update
  #   @recipe = Recipe.find(params[:recipe_id])
  #   @recipe_ingredients = @recipe.recipe_ingredients

  #   @amount = params["/recipe_ingredients"].values[0].to_i
  #   @ingredient_id = params['ingredient_id'].to_i

  #   setter = RecipeIngredient.set_amount(@recipe.id, @ingredient_id, @amount)

  #   redirect_to recipe_path(@recipe)
  # end

end
