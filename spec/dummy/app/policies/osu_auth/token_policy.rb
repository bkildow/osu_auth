class TokenPolicy < ApplicationPolicy

  def show?
    @user.can?(:administer_tokens)
  end

  def update?
    show?
  end

  def destroy?
    show?
  end

end
