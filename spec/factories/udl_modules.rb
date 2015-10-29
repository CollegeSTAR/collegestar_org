FactoryGirl.define do
  factory :udl_module do
    sequence(:title) { |n| "Test Module #{n}" }
    sequence(:slug) { |n| "test-module-#{n}" }
    sub_heading 'testing modules all the time'
    udl_representation '1'
    udl_action_expression '1'
    udl_engagement '0'
    description 'This is a test module used to test modules...'
  end

  factory :new_udl_module, class: UdlModule do
    title "test"
    slug "test"
    sub_heading "My sub heading"
    udl_representation "1"
    udl_action_expression "1"
    udl_engagement "0"
    description "Test description"
  end
end
