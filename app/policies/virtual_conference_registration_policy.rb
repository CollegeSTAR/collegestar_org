class VirtualConferenceRegistrationPolicy < ApplicationPolicy
  def initialize(user, record)
    super(user, record)
    @accepted_admin_roles << :conference_admin
  end
  
  def new?
    true
  end

  def create?
    new?
  end

  def index?
    return true if user.has_role? @accepted_admin_roles
    false
  end

  def show?
    index?
  end
end
