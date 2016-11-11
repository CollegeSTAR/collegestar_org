FactoryGirl.define do
  factory :basic_role, class: Role do
    name "basic"
    description "Basic: A basic role."
    grantable true
  end

  factory :admin, class: Role do
    name "admin"
    description "Admin: Has keys to the kingdom."
    grantable false
  end

  factory :events_admin, class: Role do
    name "events_admin"
    description "Events Admin: Can administer events"
    grantable true
  end

  factory :contacts_admin, class: Role do
    name "contacts_admin"
    description "Contact Admin: Can administer contacts"
    grantable true
  end

  factory :campus_admin, class: Role do
    name "campus_admin"
    description "Campus Admin: "
    grantable true
  end
  
  factory :granter, class: Role do
    name "granter"
    description "Granter: "
    grantable false
  end
 
  factory :modules_admin, class: Role do
    name "modules_admin"
    description "Modules Admin: "
    grantable true
  end

  factory :modules_author, class: Role do
    name "modules_author"
    description "Modules Author: "
    grantable true
  end

  factory :module_proposals_admin, class: Role do
    name "module_proposals_admin"
    description "Module Proposals Admin: "
    grantable true
  end  
  
  factory :news_articles_admin, class: Role do
    name "news_articles_admin"
    description "News Articles Admin: "
    grantable true
  end

  factory :page_admin, class: Role do
    name "page_admin"
    description "Page Content Admin"
    grantable true
  end
  
  factory :redesign_summaries_admin, class: Role do
    name "redesign_summaries_admin"
    description "Redesign Summaries Admin: "
    grantable true
  end
  
  factory :users_admin, class: Role do
    name "users_admin"
    description "Users Admin: "
    grantable false
  end

  factory :star_learning_communities_admin, class: Role do
    name "star_learning_communities_admin"
    description "STAR Learning Communities Admin: "
    grantable true
  end

  factory :non_grantable_role, class: Role do
    name "non_grantable_role"
    description "A role that should not be scoped to grantable"
    grantable false
  end

  factory :grantable_role, class: Role do
    name "grantable_role"
    description "A role that should be scoped to grantable"
    grantable true
  end
end
