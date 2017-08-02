module FactoryHelper
 extend self

  def find_role( role_name )
    if Role.find_by_name( role_name ).blank?
      role = FactoryGirl.create(role_name.to_sym)
    else
      role = Role.find_by_name role_name
    end
  end
end

FactoryGirl.define do
  factory :user do
    title "Mr."
    sequence( :first_name ) { |n| "John_#{n}" }
    sequence( :last_name ) { |n| "Smith_#{n}" }
    sequence( :email ) { "#{first_name}.#{last_name}@example.com".downcase }
    department "IT"
    password "secret_pass"
    password_confirmation "secret_pass"
    phone_number "1236541234"

    factory :admin_user, class: User do
      after(:create) { |user| user.roles << FactoryHelper.find_role( "admin" ) }
    end

    factory :campus_admin_user, class: User do
      after(:create) { |user| user.roles << FactoryHelper.find_role( "campus_admin" ) }
    end
    
    factory :contacts_admin_user, class: User do
      after(:create) { |user| user.roles << FactoryHelper.find_role( "contacts_admin" ) }
    end
    
    factory :content_editor_user, class: User do
      after(:create) { |user| user.roles << FactoryHelper.find_role( "content_editor" ) }
    end
    
    factory :dss_contacts_admin_user, class: User do
      after(:create) { |user| user.roles << FactoryHelper.find_role( "dss_contacts_admin" ) }
    end

    factory :events_admin_user, class: User do
      after(:create) { |user| user.roles << FactoryHelper.find_role( "events_admin" ) }
    end

    factory :faculty_nomination_surveys_viewer_user, class: User do
      after(:create) { |user| user.roles << FactoryHelper.find_role( "faculty_nomination_surveys_viewer" ) }
    end

    factory :faculty_nomination_surveys_admin_user, class: User do
      after(:create) { |user| user.roles << FactoryHelper.find_role( "faculty_nomination_surveys_admin" ) }
    end

    factory :modules_admin_user, class: User do
      after(:create) { |user| user.roles << FactoryHelper.find_role( "modules_admin" ) }
    end

    factory :modules_author_user, class: User do
      after(:create) { |user| user.roles << FactoryHelper.find_role( "modules_author") }
    end

    factory :module_proposals_admin_user, class: User do
      after(:create) { |user| user.roles << FactoryHelper.find_role( "module_proposals_admin" ) }
    end

    factory :news_articles_admin_user, class: User do
      after(:create) { |user| user.roles << FactoryHelper.find_role( "news_articles_admin" ) }
    end
     
    factory :page_admin_user, class: User do
      after(:create) { |user| user.roles << FactoryHelper.find_role( "page_admin" ) }
    end
   
    factory :redesign_summaries_admin_user, class: User do
      after(:create) { |user| user.roles << FactoryHelper.find_role( "redesign_summaries_admin" ) }
    end

    factory :star_learning_communities_admin_user, class: User do
      after(:create) { |user| user.roles << FactoryHelper.find_role( "star_learning_communities_admin" ) }
    end

    factory :student_support_program_admin_user, class: User do
      after(:create) { |user| user.roles << FactoryHelper.find_role( "student_support_program_admin" ) }
    end

    factory :udl_resources_admin_user, class: User do
      after(:create) { |user| user.roles << FactoryHelper.find_role( "udl_resources_admin" ) }
    end

    factory :users_admin_user, class: User do
      after(:create) { |user| user.roles << FactoryHelper.find_role( "users_admin" ) }
    end
  end
  
  factory :password_update_user, class: User do
    title "Mr. "
    first_name "John"
    last_name "Smith"
    email "password.updater@example.com"
    password "secret_pass"
    password_confirmation "secret_pass"
    phone_number "1236541234"
  end

  factory :user_with_uppercase_email, class: User do
    title "Mr. "
    first_name "John"
    last_name "Smith"
    email "John.Smith@example.com"
    password "secret_pass"
    password_confirmation "secret_pass"
    phone_number "1234567890"
  end
end
