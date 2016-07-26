class EventPolicy < ApplicationPolicy
  
  def initialize(user, record)
    super(user, record)
    @accepted_admin_roles << :events_admin
  end

  def index?
    true
  end

  def show?
    index?
  end

  def new?
    return true if user.has_role? @accepted_admin_roles  
    false
  end

  def create?
    new?
  end

  def edit?
    new?
  end

  def update?
    new?
  end

  def destroy?
    new?
  end

  def view_admin?
    new?
  end
end
