class BookstorePolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    user.has_role?('Librarian')
  end

  def show?
    user.has_role?('Librarian') and scope.where(:id => record.id).exists?
  end

  def create?
    user.has_role?('Administrator')
  end

  def new?
    create?
  end

  def update?
    user.has_role?('Administrator')
  end

  def edit?
    update?
  end

  def destroy?
    user.has_role?('Administrator') and record.items.empty?
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end
end

