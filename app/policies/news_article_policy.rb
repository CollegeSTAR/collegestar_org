class NewsArticlePolicy < ApplicationPolicy
  
  def initialize(user, record)
    super(user, record)
    @accepted_admin_roles << :news_articles_admin
  end

  def index?
    true
  end

  def show?
    return true if user.has_role?( @accepted_admin_roles )
    return true unless record.released == false
  end

  def new?
    return true if user.has_role?( @accepted_admin_roles )
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
end
