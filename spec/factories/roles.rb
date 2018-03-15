FactoryGirl.define do
  factory :basic_role, class: Role do
    name "basic"
    description "Basic: A basic role."
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

  factory :admin, class: Role do
    name "admin"
    description "Admin: Has keys to the kingdom."
    grantable false
  end

factory :campus_admin, class: Role do
    name "campus_admin"
    description "Campus Admin: "
    grantable true
  end

  factory :contacts_admin, class: Role do
    name "contacts_admin"
    description "Contact Admin: Can administer contacts"
    grantable true
  end
 
  factory :content_editor, class: Role do
    name "content_editor"
    description "Frequently Asked Quesitons Admin: "
    grantable true
  end

  factory :dss_contacts_admin, class: Role do
    name "dss_contacts_admin"
    description "DSS Contacts Admin: "
    grantable true
  end
  
  factory :events_admin, class: Role do
    name "events_admin"
    description "Events Admin: Can administer events"
    grantable true
  end

  factory :faculty_nomination_surveys_viewer, class: Role do
    name "faculty_nomination_surveys_viewer"
    description "Faculty Nomination Surveys Viewer: Can view faculty nomination surveys"
    grantable true
  end

  factory :faculty_nomination_surveys_admin, class: Role do
    name "faculty_nomination_surveys_admin"
    description "Faculty Nomination Surveys Admin: Can administer faculty nomination surveys"
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
  
  factory :module_histories_admin, class: Role do
    name "module_histories_admin"
    description "Module Histories Admin: "
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

  factory :star_learning_communities_admin, class: Role do
    name "star_learning_communities_admin"
    description "STAR Learning Communities Admin: "
    grantable true
  end
  
  factory :student_support_program_admin, class: Role do
    name "student_support_program_admin"
    description "Student Support Program Administrator: "
    grantable true
  end
  factory :student_support_summit_registrations_admin, class: Role do
    name "student_support_summit_registrations_admin"
    description "Student Support Summit Registration Administrator: "
    grantable true
  end
  factory :udl_resources_admin, class: Role do
    name "udl_resources_admin"
    description "Universal Design For Learning Resource Admin: "
    grantable true
  end
  
  factory :users_admin, class: Role do
    name "users_admin"
    description "Users Admin: "
    grantable false
  end
end
