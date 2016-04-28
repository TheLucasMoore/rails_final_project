class Recipe < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  
  has_many :comments
  belongs_to :user
  has_one :rating

  validates :name, presence: true
  validates :description, presence: true

  #accepts_nested_attributes_for :ingredients

  def ingredients_attributes=(ingredients_attributes)
    ingredients_attributes.each do |i, ingredient_attributes|
      #raise ingredient_attributes.inspect
      self.ingredients.build(ingredient_attributes)
    end
  end

  def ingredients=(ingredients_array)
    ingredients_array.each do |ing|
     if ing != "" 
      new_ingredient = Ingredient.find_by_id(ing)
      self.ingredients << new_ingredient
    end
    end
  end
end
