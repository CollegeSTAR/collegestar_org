class UserPolicy < ApplicationPolicy

  def index?
    if user.has_role?( @accepted_admin_roles )
      return true
    end
    false
  end

  def create?
    true
  end

  def new?
    create?
  end

  def show?
    if user.has_role?( @accepted_admin_roles ) || user.id == record.id
      return true
    end
    false
  end

  def update?
    show?
  end

  def edit?
    update?
  end

  def destroy?
    show?
  end

  def view_admin?
    index?
  end
end
