class Ability
  include CanCan::Ability

  def initialize(user)
    case user.try(:role).try(:name)
    when 'Administrator'
      can :read, UserGroup
    when 'Librarian'
      can :read, UserGroup
    when 'User'
      can :read, UserGroup
    else
      can :read, UserGroup
    end
  end
end
