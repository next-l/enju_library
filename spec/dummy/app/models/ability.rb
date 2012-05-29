class Ability
  include CanCan::Ability

  def initialize(user)
    case user.try(:role).try(:name)
    when 'Administrator'
      can :read, Bookstore
      can :read, Shelf
      can :read, Library
      can :read, LibraryGroup
    when 'Librarian'
      can :read, Bookstore
      can :read, Shelf
      can :read, Library
      can :read, LibraryGroup
    when 'User'
      can :read, Bookstore
      can :read, Shelf
      can :read, Library
      can :read, LibraryGroup
    else
      can :read, Bookstore
      can :read, Shelf
      can :read, Library
      can :read, LibraryGroup
    end
  end
end
