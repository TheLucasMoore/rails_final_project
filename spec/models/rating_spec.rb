require 'rails_helper'

RSpec.describe Rating, type: :model do

  before :each do 
    
    @user = User.create(
    email: Faker::Internet.email,
    password: Faker::Internet.password
    )

    @recipe = Recipe.create(
    name: Faker::Name.first_name + "'s" + Faker::Lorem.word,
    description: Faker::Lorem.sentence
    )

    @rating = Rating.new
    @rating.rating = 5
    @rating.user = @user
    @rating.recipe = @recipe
    @rating.save
  end
  

  it "belongs to a user" do
    expect(@rating.user).to eq(@user)
  end

  it "belongs to a recipe" do
    expect(@rating.recipe).to eq(@recipe)
  end

  it "must be a number less than five" do
    expect(@rating.rating).to eq(5)
  end

  it "won't save an invalid rating" do
    @rating = Rating.new
    @rating.rating = 7
    @rating.user = @user
    @rating.recipe = @recipe

    expect(@rating.save).to be false
    expect(@rating.errors.messages).to be_truthy
  end
end
