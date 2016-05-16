class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :user_id, :rating
end
