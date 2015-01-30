class OsuAuth::UserPolicy < ApplicationPolicy

  def index?
    @user.can?(:view_users)
  end

  def show?
    @user.can?(:view_users)
  end

  def create?
    @user.can?(:add_user)
  end

  def new?
    create?
  end

  def update?
    @user.can?(:edit_user)
  end

  def edit?
    update?
  end

  def destroy?
    @user.can?(:delete_user)
  end

  def masquerade?
    @user.super_admin?
  end

  # Exclude super admin users if user is not a super admin.
  class Scope < Scope
    def resolve
      if @user.super_admin?
        scope.all
      else
        scope.where(super_admin: false)
      end
    end
  end

end
