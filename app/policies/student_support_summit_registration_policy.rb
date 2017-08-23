class StudentSupportSummitRegistrationPolicy < ApplicationPolicy
  def initialize(user, record)
    super(user, record)
    @accepted_admin_roles << :student_support_summit_registrations_admin
  end

  def index?
    return true if user.has_role? @accepted_admin_roles
    false
  end

  def show?
    index?
  end
  
  def new?
    true
  end

  def create?
    new?
  end

  def view_admin?
    index?
  end

end
