class Ingredient < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients

  validates :name, presence: true

  def recipe_amount(recipe)
    q = RecipeIngredient.find_by(:recipe_id => recipe, :ingredient_id => self.id)
    return q.quantity
  end

  def recipe_amount=(amount)
    q = RecipeIngredient.find_by(:recipe_id => recipe, :ingredient_id => self.id)
    q.quantity = amount
    q.save
  end
end
