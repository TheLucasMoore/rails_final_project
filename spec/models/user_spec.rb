require 'rails_helper'

RSpec.describe User, type: :model do

  before :each do
    @user = User.create(
      email: Faker::Internet.email,
      password: Faker::Internet.password
      )

  3.times do
    @recipe = Recipe.create(
      name: Faker::Name.first_name + "'s" + Faker::Lorem.word,
      description: Faker::Lorem.sentence,
      user_id: @user.id
      )

    @comment = Comment.create(
      user_id: @user.id, 
      recipe_id: 1,
      content: Faker::Lorem.sentence
      )

    @rating = Rating.create(
      user_id: @user.id, 
      recipe_id: 1,
      rating: Faker::Number.between(1, 5)
      )
  end
  end
  
  it "a user has many recipes" do
    expect(@user.recipes.count).to eq(3)
  end
  #this is why testing rocks. I found that recipes didn't belong to a user!

  it "a user has many comments" do
    expect(@user.comments.count).to eq(3)
  end

  it "a user has many ratings" do
    expect(@user.ratings.count).to eq(3)
  end

end
