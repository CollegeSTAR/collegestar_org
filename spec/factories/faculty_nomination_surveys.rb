FactoryBot.define do
  factory :faculty_nomination_survey do

    teaching_strategy { "The strategy is a very long string so that we can test truncation. So adding a little more text for good measure. Just a little more! That oughta do it!" }
    strategy_description { "The description" }
    reasons_for_effectiveness { "The reasons" }
    faculty_first_name { "Jane" }
    faculty_last_name { "Doe" }
    
    #add institutional_faculty association
    institutional_faculty
    department { create(:institutional_department) }
  end
end
