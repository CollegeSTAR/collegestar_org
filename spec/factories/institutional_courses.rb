FactoryBot.define do
  
  factory :institutional_course do
    sequence(:course_number) { |n| "#{n}" }
    sequence(:course_name) { |n| "Course #{n}" }

    association :campus
  end
end
