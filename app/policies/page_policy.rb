class PagePolicy < ApplicationPolicy

  def initialize(user, record)
    super(user, record)
    @accepted_admin_roles << :page_admin
  end

  def index?
    return true if user.has_role? @accepted_admin_roles
    false
  end

  def show?
    index?
  end

  def new?
    index?
  end

  def create?
    index?
  end

  def edit?
    index?
  end

  def update?
    index?
  end

  def destroy?
    index?
  end

  def view_admin?
    index?
  end
end
