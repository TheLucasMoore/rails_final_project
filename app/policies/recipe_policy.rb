class RecipePolicy < ApplicationPolicy

  def destroy?
    user.admin?
  end
  
end
