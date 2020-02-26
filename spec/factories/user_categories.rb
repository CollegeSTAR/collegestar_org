FactoryBot.define do
  factory :user_category do
    sequence(:name) { |n| "User Category #{n}" }
    selectable { true }

    factory :non_selectable_user_category, class: UserCategory do
      sequence(:name) { |n| "Non-selectable User Category #{n}" }
      selectable { false }
    end
  end
end
