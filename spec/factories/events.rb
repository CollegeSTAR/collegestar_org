FactoryBot.define do
  factory :event do
    sequence(:name) { |n| "Name #{n}" }
    slug { name.parameterize }
  end
end
