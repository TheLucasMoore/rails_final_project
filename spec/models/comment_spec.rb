require 'rails_helper'

RSpec.describe CommentsController, type: :controller do

  before :each do 
    @user = User.create(
      email: Faker::Internet.email,
      password: Faker::Internet.password
      )

    @recipe = Recipe.create(
      name: Faker::Name.first_name + "'s" + Faker::Lorem.word,
      description: Faker::Lorem.sentence
      )

    @comment = Comment.create(
      user_id: @user.id,
      recipe_id: @recipe.id,
      content: "Omg. totally my favorite dish ever!"
      )
  end

  describe 'Comment#User' do
    
  it "comments belong to a user" do
  expect(@comment.user_id).to eq(@user.id)
  expect(@comment.user).to eq(@user)
  end

  it "comments belong to a recipe" do
  expect(@comment.recipe_id).to eq(@recipe.id)
  expect(@comment.recipe).to eq(@recipe)
  end

  it "has comment content" do
    expect(@comment.content).to eq("Omg. totally my favorite dish ever!")
  end

  it "shows all comments from a user" do 
    @comment2 = Comment.create(
    user_id: @user.id,
    recipe_id: @recipe.id,
    content: "This is a second comment about the food and such!"
    )

    expect(@user.comments.count).to eq(2)
  end

  end

end
