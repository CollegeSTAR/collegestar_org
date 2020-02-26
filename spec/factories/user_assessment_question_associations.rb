FactoryBot.define do
  factory :user_assessment_question_association do
    sequence(:position) { |n| n }
    user_module_assessment
    association :assessment_question, factory: :assessment_question_with_answer_choices
    correct { false }

    after(:create) do |assoc, evaluator|
      ac_hash = {}
      evaluator.assessment_question.assessment_answer_choice_ids.each_with_index do |id, index|
        ac_hash[index] = { id: id }
      end
      assoc.answer_choices = JSON.generate( ac_hash )
    end
  end
end
