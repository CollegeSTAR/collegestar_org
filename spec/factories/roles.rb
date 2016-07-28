FactoryGirl.define do
  factory :basic_role, class: Role do
    name "basic"
    conditions "id"
  end

  factory :admin_role, class: Role do
    name "admin"
  end

  factory :events_admin_role, class: Role do
    name "events_admin"
  end

  factory :contact_admin_role, class: Role do
    name "contact_admin"
  end

  factory :campus_admin_role, class: Role do
    name "campus_admin"
  end
  
  factory :granter_role, class: Role do
    name "granter"
  end
 
  factory :module_admin_role, class: Role do
    name "modules_admin"
  end

  factory :module_author_role, class: Role do
    name "modules_author"
  end

  factory :module_proposals_admin_role, class: Role do
    name "module_proposals_admin"
  end  
  
  factory :news_articles_admin_role, class: Role do
    name "news_articles_admin"
  end
  
  factory :redesign_summaries_admin_role, class: Role do
    name "redesign_summaries_admin"
  end
  
  factory :users_admin_role, class: Role do
    name "users_admin"
  end
end
