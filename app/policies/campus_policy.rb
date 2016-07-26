class CampusPolicy < ApplicationPolicy
  
  def initialize(user, record)
    super(user, record)
    @accepted_admin_roles << :campus_admin
  end

  def index?
    true
  end

  def show?
    true
  end

  def new?
    if user.has_role?( @accepted_admin_roles )
      return true
    end
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
