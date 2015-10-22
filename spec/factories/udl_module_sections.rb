FactoryGirl.define do
  factory :udl_module_section do
    sequence(:title) { |n| "New Section Title #{n}" }
    content "This is the content for this section"
    parent "Introduction"
    sequence(:position) { |n| "#{n}" }
  end
end
