class UserModuleAssessmentPolicy < ApplicationPolicy

  def show?
    return true if user.has_role?( @accepted_admin_roles ) 
    return true if user == record.user
    false
  end
end
