FactoryGirl.define do
  factory :udl_module_section do
    sequence(:title) { |n| "New Section Title #{n}" }
    content "This is the content for this section"
    parent "introduction"
    sequence(:position) { |n| "#{n}" }
  end

  factory :introduction_section, class: UdlModuleSection do
    title "An intro section"
    content "This is a section in the introduction page."
    parent "introduction"
    sequence(:position) { |n| "#{n}" }
  end  
  
  factory :udl_principles_section, class: UdlModuleSection do
    title "A UDL Principles section"
    content "This is a section in the UDL Principles page."
    parent "udl_principles"
    sequence(:position) { |n| "#{n}" }
  end
  
  factory :instructional_practice_section, class: UdlModuleSection do
    title "An instructional practice section"
    content "This is a section in the introduction page."
    parent "instructional_practice"
    sequence(:position) { |n| "#{n}" }
  end

  factory :learn_more_section, class: UdlModuleSection do
    title "A learn more section"
    content "This is a section in the learn more page."
    parent "learn_more"
    sequence(:position) { |n| "#{n}" }
  end

  factory :references_section, class: UdlModuleSection do
    title "A references section"
    content "This is a section in the references page."
    parent "references"
    sequence(:position) { |n| "#{n}" }
  end

end
