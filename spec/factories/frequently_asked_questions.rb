FactoryBot.define do
  factory :frequently_asked_question do
    sequence(:question) { |n| "This is question #{n}" }
    slug { question.parameterize }
    sequence(:answer) { |n| "This is answer #{n}"}
  end
end
