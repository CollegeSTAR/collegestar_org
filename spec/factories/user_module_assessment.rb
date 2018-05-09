FactoryBot.define do
  factory :user_module_assessment do
    questions_order "{}"
    score '100'
    user
    udl_module

    after(:create) do |assessment|
      4.times do
        assessment.user_assessment_question_associations << create(:user_assessment_question_association, user_module_assessment_id: assessment.id)
      end
    end
  end
end
