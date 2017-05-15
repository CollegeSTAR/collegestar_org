class UdlModulePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve

    end
  end

  def initialize(user, record)
    super(user, record)
    @accepted_admin_roles << :modules_admin
  end

  def index?
    true
  end

  def show?
    true
  end

  def dashboard?
    if user.has_role?( @accepted_admin_roles ) || user.has_role?( :modules_author )
      return true
    end
    false
  end

  def new?
    dashboard? 
  end
  
  def create?
    new?
  end

  def edit?
    # Admin status check
    if user.has_role?( @accepted_admin_roles )
      return true
    end
    # if module is authored by user return true
    author_ids = record.authors.map { |author| author.id }
    return true if author_ids.include? user.id

    return false
  end

  def update?
    edit?
  end

  def destroy?
    if user.has_role?( :admin )
      return true
    end
    false
  end

  def admin?
    return true if user.has_role? @accepted_admin_roles
    false
  end

  def view_admin?
    return true if user.has_role?( [ @accepted_admin_roles , :modules_author ].flatten )
    false
  end
end
