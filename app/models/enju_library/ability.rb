module EnjuLibrary
  class Ability
    include CanCan::Ability
  
    def initialize(user, ip_address = nil)
      case user.try(:role).try(:name)
      when 'Administrator'
        can [:read, :create, :update], Bookstore
        can [:delete, :destroy], Bookstore do |bookstore|
          bookstore.items.empty?
        end
        can [:read, :create, :update], Library
        can [:delete, :destroy], Library do |library|
          library.shelves.empty? && !library.web?
        end
        can [:read, :create, :update], Shelf
        can [:delete, :destroy], Shelf do |shelf|
          shelf.items.empty? && !shelf.web_shelf?
        end
        can :manage, [
          Accept,
          BudgetType,
          SearchEngine,
          Subscribe,
          Subscription
        ]
        can :update, [
          LibraryGroup,
          RequestStatusType,
          RequestType
        ] if LibraryGroup.site_config.network_access_allowed?(ip_address, network_type: :admin)
        can :read, [
          LibraryGroup,
          RequestStatusType,
          RequestType
        ]
      when 'Librarian'
        can :manage, [
          Accept,
          Subscribe,
          Subscription
        ]
        can :read, [
          Bookstore,
          BudgetType,
          Library,
          LibraryGroup,
          RequestStatusType,
          RequestType,
          SearchEngine,
          Shelf
        ]
      when 'User'
        can :read, [
          Library,
          LibraryGroup,
          Shelf
        ]
      else
        can :read, [
          Library,
          LibraryGroup,
          Shelf
        ]
      end
    end
  end
end
