FactoryBot.define do
  factory :news_letter_subscription do
    sequence(:first_name) { |n| "John#{n}" }
    sequence(:last_name) { |n| "Smith#{n}" }
    title { "Mr." }
    company { "WidgetCo" }
    email { "#{first_name}.#{last_name}@widgetco.com" }
    case_studies { true }
    research { true }
  end
end
