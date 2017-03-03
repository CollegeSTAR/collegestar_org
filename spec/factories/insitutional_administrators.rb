FactoryGirl.define do
  
  factory :institutional_administrator do
    title "Dr."
    sequence(:first_name) { |n| "john#{n}" }
    sequence(:last_name) { |n| "smith#{n}" }
  end
end
