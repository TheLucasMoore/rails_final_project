class UserPolicy < ApplicationPolicy

  def destroy?
    user.admin?
  end

end