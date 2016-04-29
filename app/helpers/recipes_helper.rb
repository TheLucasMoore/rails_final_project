module RecipesHelper

  def recipe_info
    
  end

  def comment_count(recipe)
    count = recipe.comments.size
    pluralize(count, 'comment')
  end

  def rating
    @recipe.rating
  end
end
