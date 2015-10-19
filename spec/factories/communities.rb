FactoryGirl.define do
  factory :community do
    sequence( :name ) { |n|  "Test Community #{n}" }
    sequence( :slug ) { |n| "test-community-#{n}" }
    description "This is my description."
  end
end
