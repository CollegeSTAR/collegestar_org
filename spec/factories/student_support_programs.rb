FactoryGirl.define do
  factory :student_support_program do
    sequence(:name) { |n| "Student Support Program #{n}" }
    sequence(:slug) { |n| "student-support-program-#{n}" }
  end
end
