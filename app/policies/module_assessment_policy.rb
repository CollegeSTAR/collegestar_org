class ModuleAssessmentPolicy < ApplicationPolicy
  def initialize(user, record)
    super(user, record)
    @accepted_admin_roles << :modules_admin
  end

  def create?
    return false if user.id == nil #null user
    true
  end

  def show?
    create?
  end
end
