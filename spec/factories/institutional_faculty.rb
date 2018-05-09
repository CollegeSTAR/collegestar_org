FactoryBot.define do
  
  factory :institutional_faculty do
    sequence( :first_name ) { |n| "John#{n}" }
    sequence( :last_name ) { |n| "Smith#{n}" }
    email { "#{first_name}.#{last_name}@example.com" }
  end
end
