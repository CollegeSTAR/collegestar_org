class RolePolicy < ApplicationPolicy
  
  def grant?
    return true if user.has_role? [:admin, :users_admin, :granter]
    return false
  end
end
