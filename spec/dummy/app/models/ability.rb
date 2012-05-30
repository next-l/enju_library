class Ability
  include CanCan::Ability

  def initialize(user, ip_address = nil)
    case user.try(:role).try(:name)
    when 'Administrator'
      can [:read, :create, :update], Bookstore
      can [:read, :create, :update], Shelf
      can [:read, :create, :update], Library
      can [:read, :update], LibraryGroup
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
