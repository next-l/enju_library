class ShelfPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true if user.try(:has_role?, 'Librarian')
  end

  def create?
    true if user.try(:has_role?, 'Administrator')
  end

  def update?
    true if user.try(:has_role?, 'Administrator')
  end

  def destroy?
    if user.try(:has_role?, 'Administrator')
      true if record.items.empty? && !record.web_shelf?
    end
  end
end
