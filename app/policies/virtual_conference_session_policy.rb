class VirtualConferenceSessionPolicy < ApplicationPolicy
  def initialize(user, record)
    super(user, record)
    @accepted_admin_roles << :conference_admin
  end
  
  def new?
    return true if user.has_role? @accepted_admin_roles
    false
  end

  def edit?
    new?
  end

  def create?
    new?
  end

  def update?
    new?
  end

  def index?
    true
  end

  def show?
    index?
  end
end
