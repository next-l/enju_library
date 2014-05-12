class AcceptPolicy < ApplicationPolicy
  class Scope < Struct.new(:user, :scope)
    def resolve
      scope.all
    end
  end

  def index?
    user.try(:has_role?, 'Librarian')
  end

  def show?
    user.try(:has_role?, 'Librarian')
  end

  def create?
    user.try(:has_role?, 'Librarian')
  end

  def update?
    user.try(:has_role?, 'Administrator')
  end

  def destroy?
    user.try(:has_role?, 'Librarian')
  end
end
