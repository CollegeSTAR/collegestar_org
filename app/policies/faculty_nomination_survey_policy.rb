class FacultyNominationSurveyPolicy < ApplicationPolicy
  
  def initialize( user, record )
    super( user, record )
    @accepted_admin_roles << :faculty_nomination_surveys_admin
  end

  def index?
    return true if user.has_role? @accepted_admin_roles
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
    index?
  end

  def update?
    index?
  end

  def view_admin?
    index?
  end
end
