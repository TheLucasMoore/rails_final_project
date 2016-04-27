# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first
#   

  10.times do

    User.create(
      email: Faker::Internet.email,
      password: Faker::Internet.password
      )

    Recipe.create(
      name: Faker::Name.first_name + "'s " + Faker::Lorem.word,
      description: Faker::Lorem.sentence,
      user_id: Faker::Number.between(1, 10)
      )

    Ingredient.create(
      name: Faker::Lorem.word
      )

    Comment.create(
      user_id: Faker::Number.between(1, 10),
      recipe_id: Faker::Number.between(1, 10), 
      content: Faker::Lorem.sentence
      )

    Rating.create(
     user_id: Faker::Number.between(1, 10),
     recipe_id: Faker::Number.between(1, 10), 
     rating: Faker::Number.between(1, 5)
      )

    RecipeIngredient.create(
      recipe_id: Faker::Number.between(1, 10),
      ingredient_id: Faker::Number.between(1, 10),
      quantity: Faker::Number.between(1, 10)
      )

  end

 