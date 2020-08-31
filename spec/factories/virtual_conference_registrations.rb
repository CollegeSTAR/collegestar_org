FactoryBot.define do
  factory :virtual_conference_registration do
    sequence(:first_name) { |n| "John#{n}" }
    sequence(:last_name) { |n| "Smith#{n}" }
    email { "#{last_name}.#{first_name}@example.com" }
    state { "NC" }
    number_of_participants { 1 }
  end
end
