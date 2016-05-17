class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :user_id, :rating
  has_many :ingredients
end
