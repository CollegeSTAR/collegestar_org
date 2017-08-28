class StudentSupportProgramPolicy < ApplicationPolicy
  
  def initialize(user, record)
    super(user, record)
    @accepted_admin_roles << :student_support_program_admin
  end

  def index?
    true
  end

  def show?
    true
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

  def delete?
    new?
  end

  def view_admin?
    new?
  end
end
