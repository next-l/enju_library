class Ability
  include CanCan::Ability

  def initialize(user, ip_address = nil)
    case user.try(:role).try(:name)
    when 'Administrator'
      can [:read, :create, :update], Bookstore
      can :destroy, Bookstore do |bookstore|
        if defined?(EnjuPurchaseRequest)
          bookstore.order_lists.empty? and bookstore.items.empty?
        else
          bookstore.items.empty?
        end
      end
      can [:read, :create, :update], Library
      can :destroy, Library do |library|
        library.shelves.empty? and !library.web?
      end
      can [:read, :update], LibraryGroup
      can [:read, :create, :update], Shelf
      can :destroy, Shelf do |shelf|
        shelf.items.empty?
      end
      can :manage, Subscribe
      can :manage, Subscription
    when 'Librarian'
      can :read, Bookstore
      can :read, Library
      can :read, LibraryGroup
      can :read, Shelf
      can :manage, Subscribe
      can :manage, Subscription
    when 'User'
      can :read, Shelf
      can :read, Library
      can :read, LibraryGroup
    else
      can :read, Library
      can :read, LibraryGroup
      can :read, Shelf
    end
  end
end
