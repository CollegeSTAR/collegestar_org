FactoryBot.define do
  factory :assessment_answer_choice do
    sequence( :text ) { |n| "answer_choice#{n}" }
    sequence( :position ) { |n| n }
  end
end
