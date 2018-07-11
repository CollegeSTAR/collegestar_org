class ThreeTwoOneVideoPolicy < ApplicationPolicy
  
  def initialize(user, record)
    super(user, record)
    @accepted_admin_roles << :three_two_one_videos_admin
  end

  def index?
    true
  end

  def show?
    if record.released || user.has_role?( @accepted_admin_roles )
      true
    else
      false
    end
  end

  def new?
    if user.has_role?( @accepted_admin_roles )
      true
    else
      false
    end
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

  def view_admin?
    new?
  end
end
