class RecipePolicy < ApplicationPolicy

  def new?
  end

  def create?
  end

  def destroy?
    user.admin?
  end

  def edit?
    record = user || user.admin? || user.moderator?
  end

  def update?
    record = user || user.admin? || user.moderator?
  end
  
end