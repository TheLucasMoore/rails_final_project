class Recipe < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  
  has_many :comments
  belongs_to :user

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :description, presence: true

  accepts_nested_attributes_for :ingredients

  def self.find_recipe(term)
    recipe = Recipe.find_by(name: term)
  end

  def ingredients_attributes=(ingredients_attributes)
    if ingredients_attributes.values[0]["name"] != ""
      #What a hack... this makes sure that the new ingredient form wasn't blank
      #before building the ingredients. It works around ingredient validation issues.
    ingredients_attributes.each do |i, ingredient_attributes|
        self.ingredients.build(ingredient_attributes)
      end
    end
  end

  def ingredients=(ingredients_array)
    #Did I need to build this custom writer? 
    #It writes to recipe.ingredients from the recipes controller
    ingredients_array.each do |ing|
    if ing != ""
      new_ingredient = Ingredient.find_by_id(ing)
        unless self.ingredients.include?(ing)
          self.ingredients << new_ingredient
          end
        end
      end
    end
end
