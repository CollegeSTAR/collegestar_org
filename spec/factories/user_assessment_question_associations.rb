FactoryGirl.define do
  factory :user_assessment_question_association do
    sequence(:position) { |n| n }
    user_module_assessment
    assessment_question
  end
end
