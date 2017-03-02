FactoryGirl.define do
  factory :universal_design_for_learning_resource do
    sequence( :title ) { |n|  "My Udl Resource #{n}" }
    sequence( :slug ) { |n|  "my-udl-resource-#{n}" }
    description "This is the description"
    content "This is the content"
  end
end
