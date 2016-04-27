class Recipe < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  
  has_many :comments
  belongs_to :user
  has_one :rating
end
