require 'rails_helper'

RSpec.describe Recipe, type: :model do
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

    describe "Relationship with ingredients" do

      it "has many ingredients in a recipe" do
        @recipe.ingredients << [@ingredient, @ingredient2]

        expect(@recipe.ingredients.count).to eq(2)
      end

      it "an ingredient can be in many recipes" do
        @recipe.ingredients << @ingredient
        @recipe2.ingredients << @ingredient

        expect(@ingredient.recipes.count).to eq(2)
      end
      
    end
end
