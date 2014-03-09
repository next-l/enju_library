class ShelfPolicy < ApplicationPolicy
  class Scope < Struct.new(:user, :scope)
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    user.try(:has_role?, 'Administrator')
  end

  def update?
    user.try(:has_role?, 'Administrator')
  end

  def destroy?
    if user.try(:has_role?, 'Administrator')
      record.items.empty? and !record.web_shelf?
    end
  end
end
