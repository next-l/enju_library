class SearchEnginePolicy < AdminPolicy
  def create?
    user.try(:has_role?, 'Administrator')
  end
end
