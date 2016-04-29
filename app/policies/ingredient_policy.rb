class IngredientPolicy < ApplicationPolicy

  def new?
  end

  def create?
  end

  def destroy?
    user.admin?
  end

  def edit?
    user.admin? || user.moderator?
  end

  def update?
    user.admin? || user.moderator?
  end
end
