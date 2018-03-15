class UserModuleHistoryPolicy < ApplicationPolicy
  
  def index?
    return true if user.id
    return false
  end
  
  def show?
    return true if user.id == record.user_id
    return false
  end
end
