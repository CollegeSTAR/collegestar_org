FactoryGirl.define do
  factory :basic_role, class: Role do
    name "basic"
    description "Basic: A basic role."
    grantable true
  end

  factory :admin_role, class: Role do
    name "admin"
    description "Admin: Has keys to the kingdom."
  end

  factory :events_admin_role, class: Role do
    name "events_admin"
    description "Events Admin: Can administer events"
    grantable true
  end

  factory :contact_admin_role, class: Role do
    name "contact_admin"
    description "Contact Admin: "
    grantable true
  end

  factory :campus_admin_role, class: Role do
    name "campus_admin"
    description "Campus Admin: "
    grantable true
  end
  
  factory :granter_role, class: Role do
    name "granter"
    description "Granter: "
    grantable false
  end
 
  factory :module_admin_role, class: Role do
    name "modules_admin"
    description "Modules Admin: "
    grantable true
  end

  factory :module_author_role, class: Role do
    name "modules_author"
    description "Modules Author: "
    grantable true
  end

  factory :module_proposals_admin_role, class: Role do
    name "module_proposals_admin"
    description "Module Proposals Admin: "
    grantable true
  end  
  
  factory :news_articles_admin_role, class: Role do
    name "news_articles_admin"
    description "News Articles Admin: "
    grantable true
  end
  
  factory :redesign_summaries_admin_role, class: Role do
    name "redesign_summaries_admin"
    description "Redesign Summaries Admin: "
    grantable true
  end
  
  factory :users_admin_role, class: Role do
    name "users_admin"
    description "Users Admin: "
    grantable false
  end
end
