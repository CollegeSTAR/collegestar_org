FactoryGirl.define do
  factory :assessment_question do
    sequence(:question) { |n| "question number #{n}" }
    explanation "This is the question's explanation"
    ordered false
  
    factory :assessment_question_with_answer_choices do
      after(:create) do |question|
        4.times do
          question.assessment_answer_choices << create(:assessment_answer_choice)
        end
        question.correct_answer_choice_id = question.assessment_answer_choices.first.id
        question.save
      end
    end

  end
end
