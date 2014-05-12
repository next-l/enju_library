class AdminAuthorizer < ApplicationAuthorizer
  def self.readable_by?(user)
    user.has_role?('Librarian')
  end

  def self.creatable_by?(user)
    user.has_role?('Administrator')
  end

  def self.updatable_by?(user)
    user.has_role?('Administrator')
  end

  def self.deletable_by?(user)
    user.has_role?('Administrator')
  end
end
