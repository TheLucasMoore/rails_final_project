class RecipeIngredient < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :ingredient

  def self.set_amount(recipe, ingredient, amount)
    r = RecipeIngredient.find_by(:recipe_id => recipe, :ingredient_id => ingredient)
    r.quantity = amount
    r.save
  end

  def self.print_amount(recipe, ingredient)
    r = RecipeIngredient.find_by(:recipe_id => recipe, :ingredient_id => ingredient)
    r.quantity if !r.nil?
  end
end