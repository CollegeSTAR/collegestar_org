FactoryGirl.define do  
  
  factory :contact do #Not an active record model
    name "Tanner Jones"
    email "jonesjoe@ecu.edu"
    subject "This is a test email subject"
    message "This is my test email message."
    send_copy 0
  end

  factory :community do
    sequence( :name ) { |n|  "Test Community #{n}" }
    sequence( :slug ) { |n| "test-community-#{n}" }
    description "This is my description."
  end
    
  factory :news_article do
    sequence( :title ) { |n| "news article #{n}" }
    sequence( :slug ) { |n| "news-article-#{n}" }
    content "This is the content of this article."
  end

  factory :campus do 
    sequence( :name ) { |n| "Campus #{n}" }
    sequence( :slug ) { |n| "campus-#{n}" }
    sequence( :abbreviation ) { |n| "c#{n}" }
    institution_type "university"
    address_1 "1000 AnyStreet"
    city "AnyPlace"
    state "NC"
    zip "12345"
  end

  factory :event do
    sequence( :name ) { |n| "Event name #{n}" }
    sequence( :slug ) { |n| "event-slug-#{n}" }
    registration_open_datetime { Time.now }
    registration_close_datetime { Time.now + 1.week }
    start_datetime { Time.now + 4.weeks }
    end_datetime { Time.now + 4.weeks + 2.days}
    address "123 Anywhere"
    city "AnyPlace"
    state "NC"
    zip_code "12345"
  end

  factory :user do
    sequence( :first_name ) { |n| "John_#{n}" }
    sequence( :last_name ) { |n| "Smith_#{n}" }
    sequence( :email ) { "#{first_name}.#{last_name}@example.com".downcase }
    password "secret_pass"
    password_confirmation "secret_pass"
  end

  factory :admin_user, class: User do
    first_name "Tanner_admin"
    last_name "Jones_admin"
    email "admin@collegestar.org"
    password "secret_pass"
    password_confirmation "secret_pass"
    after(:create) { |user| user.roles << create(:admin_role) }
  end

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

  factory :event_admin_role, class: Role do
    name "event_admin"
    action "manage"
    subject "event"
  end
end
