FactoryGirl.define do
  factory :basic_role, class: Role do
    name "basic"
    action "manage"
    subject "user"
    conditions "id"
  end

  factory :admin_role, class: Role do
    name "admin"
    action "manage"
    subject "all"
  end

  factory :events_admin_role, class: Role do
    name "events_admin"
    action "manage"
    subject "event"
  end

  factory :contact_admin_role, class: Role do
    name "contact_admin"
    action "manage"
    subject "contact"
  end

  factory :campus_admin_role, class: Role do
    name "campus_admin"
    action "manage"
    subject "campus"
  end
  
  factory :module_admin_role, class: Role do
    name "modules_admin"
    action "manage"
    subject "udl_module"
  end

  factory :module_author_role, class: Role do
    name "modules_author"
    action "manage"
    subject "udl_module"
  end

  factory :module_proposals_admin_role, class: Role do
    name "module_proposals_admin"
    action "manage"
    subject "module_proposal"
  end  
  
  factory :news_articles_admin_role, class: Role do
    name "news_articles_admin"
    action "manage"
    subject "news_article"
  end
end
