class CommentPolicy < ApplicationPolicy

  def new?
  end

  def create?
  end

  def destroy?
    record = user || user.admin?
  end

  def edit?
    user.admin? || user.moderator?
  end

  def update?
    record = user || user.admin? || user.moderator?
  end
end
