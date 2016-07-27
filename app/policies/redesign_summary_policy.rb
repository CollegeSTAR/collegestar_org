class RedesignSummaryPolicy < ApplicationPolicy
  
  def initialize(user, record)
    super(user, record)
    @accepted_admin_roles << :redesign_summaries_admin
  end

  def index?
    return true if user.id != nil  
  end

  def show?
    return true if user.has_role? @accepted_admin_roles
    return true if user.id != nil && user.id == record.user_id
    false
  end

  def new?
    index?
  end

  def create?
    index?
  end

  def edit?
    show?
  end

  def update?
    show?
  end

  def destroy?
    show?
  end

  def view_admin?
    return true if user.has_role? @accepted_admin_roles
    false
  end
end
