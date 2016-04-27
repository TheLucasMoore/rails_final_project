require 'rails_helper'

RSpec.describe Ingredient, type: :model do

  before :each do 
    @ingredient = Ingredient.create(
      name: Faker::Lorem.word
      )

    @ingredient2 = Ingredient.create(
      name: Faker::Lorem.word
      )

    @recipe = Recipe.create(
      name: Faker::Name.first_name + "'s" + Faker::Lorem.word,
      description: Faker::Lorem.sentence
      )

    @recipe2 = Recipe.create(
      name: Faker::Name.first_name + "'s" + Faker::Lorem.word,
      description: Faker::Lorem.sentence
      )
    end

    describe "Ingredient Features" do

      it "is a valid object" do
        expect(@ingredient).to be_an_instance_of Ingredient
      end

      it "is has a name" do
        expect(@ingredient.name).to_not be_empty
      end

    end

    describe "Relationship with Recipies" do

      it "has many ingredients in a recipe" do
        @recipe.ingredients << [@ingredient, @ingredient2]

        expect(@recipe.ingredients.count).to eq(2)
      end

      it "an ingredient can be in many recipes" do
        @recipe.ingredients << @ingredient
        @recipe2.ingredients << @ingredient

        expect(@ingredient.recipes.count).to eq(2)
      end

      it "tracks the quantity of ingredients in a recipe" do
        @recipeingredients= RecipeIngredient.create(
          recipe_id: @recipe.id,
          ingredient_id: @ingredient.id,
          quantity: 5
          )
        expect(@recipeingredients.recipe).to eq(@recipe)
        expect(@recipeingredients.ingredient).to eq(@ingredient)
        expect(@recipeingredients.quantity).to eq(5)
      end
    end


end
