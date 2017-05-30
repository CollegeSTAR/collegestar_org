class FacultyNominationSurveyPolicy < ApplicationPolicy
  
  def initialize( user, record )
    super( user, record )
    @accepted_admin_roles << :faculty_nomination_surveys_admin
  end

  def index?
    return true if user.has_role?( [ @accepted_admin_roles, :faculty_nomination_surveys_viewer ] )
    return false
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

  def edit?
    return true if user.has_role? @accepted_admin_roles
    return false
  end

  def update?
    edit?
  end

  def view_index?
    index?
  end

  def view_admin?
    edit?
  end
end
