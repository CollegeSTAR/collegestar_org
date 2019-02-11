FactoryBot.define do
  factory :event do
    sequence(:name) { |n| "Name #{n}" }
    slug { name.parameterize }
    address "Greenville, NC"
    start_date "2018-09-29"
    end_date "2018-09-30"
    website "www.example.com"
    description "This is the description"
  end
end
