class StudentSupportSummitQuestionnairePolicy < ApplicationPolicy
  
  def initialize(user, record)
    super(user, record)
    @accepted_admin_roles << :student_support_program_admin
  end

  def index?
    return true if user.has_role? @accepted_admin_roles
    false
  end

  def show?
    index?
  end

  def view_admin?
    index?
  end

  def new?
    true
  end

  def create?
    true
  end

  def update?
    false
  end
  
  def destroy?
    false
  end
end
