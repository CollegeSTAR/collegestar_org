FactoryBot.define do
  
  factory :institutional_administrator do
    title "Dr."
    sequence(:first_name) { |n| "john#{n}" }
    sequence(:last_name) { |n| "smith#{n}" }
    admin_email { "#{first_name}.#{last_name}@examplecom" }
  end
end
