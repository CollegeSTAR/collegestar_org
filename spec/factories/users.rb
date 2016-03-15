FactoryGirl.define do
  factory :user do
    sequence( :first_name ) { |n| "John_#{n}" }
    sequence( :last_name ) { |n| "Smith_#{n}" }
    sequence( :email ) { "#{first_name}.#{last_name}@example.com".downcase }
    password "secret_pass"
    password_confirmation "secret_pass"
    phone_number "1236541234"
  end

  factory :admin_user, class: User do
    first_name "Tanner_admin"
    last_name "Jones_admin"
    sequence(:email) { |n| "admin#{n}@collegestar.org" }
    password "secret_pass"
    password_confirmation "secret_pass"
    phone_number "1236541234"
    after(:create) { |user| user.roles << create(:admin_role) }
  end
end
