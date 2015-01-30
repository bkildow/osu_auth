class OsuAuth::RolePolicy < ApplicationPolicy

  def index?
    show?
  end

  def show?
    @user.can?(:view_roles)
  end

  def create?
    @user.can?(:add_role)
  end

  def new?
    create?
  end

  def update?
    @user.can?(:edit_role)
  end

  def edit?
    update?
  end

  def destroy?
    @user.can?(:delete_role)
  end

end
