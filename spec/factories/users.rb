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
  end

  factory :admin_user, class: User do
    title "Mr."
    first_name "Tanner_admin"
    last_name "Jones_admin"
    sequence(:email) { |n| "admin#{n}@collegestar.org" }
    password "secret_pass"
    password_confirmation "secret_pass"
    phone_number "1236541234"
    after(:create) { |user| user.roles << create(:admin_role) }
  end

  factory "campus_admin_user", class: User do
    title "Mr."
    first_name "Tanner_admin"
    last_name "Jones_admin"
    sequence(:email) { |n| "admin#{n}@collegestar.org" }
    password "secret_pass"
    password_confirmation "secret_pass"
    phone_number "1236541234"
    after(:create) { |user| user.roles << create(:campus_admin_role) }
  end
 
  factory "events_admin_user", class: User do
    title "Mr."
    first_name "Tanner_admin"
    last_name "Jones_admin"
    sequence(:email) { |n| "admin#{n}@example.org" }
    password "secret_pass"
    password_confirmation "secret_pass"
    phone_number "1236541234"
    after(:create) { |user| user.roles << create(:events_admin_role) }
  end


  factory :module_admin_user, class: User do
    title "Mr. "
    first_name "John"
    last_name "Smith"
    email "john.smith@example.com"
    password "secret_pass"
    password_confirmation "secret_pass"
    phone_number "1236541234"
    after(:create) { |user| user.roles << create(:module_admin_role) }
  end

  factory :module_author_user, class: User do
    title "Mr. "
    first_name "John"
    last_name "Smith"
    email "john.j.smith@example.com"
    password "secret_pass"
    password_confirmation "secret_pass"
    phone_number "1236541234"
    after(:create) { |user| user.roles << create(:module_author_role) }
  end

  factory :module_author_user_2, class: User do
    title "Ms. "
    first_name "Jane"
    last_name "Smith"
    email "jane.smith@example.com"
    password "secret_pass"
    password_confirmation "secret_pass"
    phone_number "1236541234"
    after(:create) { |user| user.roles << create(:module_author_role) }
  end

  factory :module_proposals_admin_user, class: User do
    title "Mr. "
    first_name "John"
    last_name "Smith"
    email "john.m.smith@example.com"
    password "secret_pass"
    password_confirmation "secret_pass"
    phone_number "1236541234"
    after(:create) { |user| user.roles << create(:module_proposals_admin_role) }
  end

  factory :news_articles_admin_user, class: User do
    title "Mr. "
    first_name "John"
    last_name "Smith"
    email "john.article.smith@example.com"
    password "secret_pass"
    password_confirmation "secret_pass"
    phone_number "1236541234"
    after(:create) { |user| user.roles << create(:news_articles_admin_role) }
  end

  factory :redesign_summaries_admin_user, class: User do
    title "Mr. "
    first_name "John"
    last_name "Smith"
    email "john.redesign.summaries.smith@example.com"
    password "secret_pass"
    password_confirmation "secret_pass"
    phone_number "1236541234"
    after(:create) { |user| user.roles << create(:redesign_summaries_admin_role) }

  end

end
