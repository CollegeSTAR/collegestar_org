FactoryGirl.define do
  factory :redesign_summary do
    title "Dr."
    first_name "John"
    last_name "Smith"
    department "English"
    campus "College STAR University"
    implemented_technique "Listen to my students"
    redesign_process "Stop ignoring my students"
    assessment_description "See what happens when I stop ignoring my students"
    examples "Joey couldn't hear me; so I listened to him, spoke louder, and now he's doing great!"
    challenges "It took a lot of energy and restraint to not ignore my students questions."
    representation false
    action_expression false
    engagement true
  end
end
