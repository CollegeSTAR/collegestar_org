FactoryGirl.define do
  factory :faculty_nomination_survey do
    teaching_strategy "The strategy"
    strategy_description "The description"
    reasons_for_effectiveness "The reasons"
    faculty_first_name "Jane"
    faculty_last_name "Doe"

    
    #add institutional_faculty association
    institutional_faculty
    association :department, factory: :institutional_department  
  end
end
