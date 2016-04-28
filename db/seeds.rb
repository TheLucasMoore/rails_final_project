# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first
#   

  User.create(
      name: Faker::Name.name,
      email: "lucas@email.net",
      password: "testtest"
      )

  10.times do 

    User.create(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      password: "testtest"
      )

    Recipe.create(
      name: Faker::Name.first_name + "'s " + Faker::Lorem.word,
      description: "Recipe Description",
      user_id: Faker::Number.between(1, 10),
      rating: Faker::Number.between(1, 5)
      )

    Ingredient.create(
      name: Faker::Lorem.word
      )

    Comment.create(
      user_id: Faker::Number.between(1, 5),
      recipe_id: Faker::Number.between(1, 5), 
      content: Faker::Lorem.sentence
      )

    RecipeIngredient.create(
      recipe_id: Faker::Number.between(1, 5),
      ingredient_id: Faker::Number.between(1, 5),
      quantity: Faker::Number.between(1, 5)
      )

  end

 