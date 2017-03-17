FactoryGirl.define do
  factory :faculty_nomination_survey do
    teaching_strategy "The strategy"
    strategy_description "The description"
    reasons_for_effectiveness "The reasons"
    
    #add institutional_faculty association
    institutional_faculty
  end
end
