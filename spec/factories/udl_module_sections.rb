FactoryGirl.define do
  factory :udl_module_section do
    sequence(:title) { |n| "New Section Title #{n}" }
    sequence(:slug) { |n| "new-section-title-#{n}" }
    content "This is the content for this section"
    parent "introduction"
  end

  factory :introduction_section, class: UdlModuleSection do
    title "An intro section"
    sequence(:slug) { |n| "an-intro-section-#{n}" }
    content "This is a section in the introduction page."
    parent "introduction"
  end  
  
  factory :udl_principles_section, class: UdlModuleSection do
    title "A UDL Principles section"
    sequence(:slug) { |n| "a-udl-principles-section-#{n}" }
    content "This is a section in the UDL Principles page."
    parent "udl_principles"
  end
  
  factory :instructional_practice_section, class: UdlModuleSection do
    title "An instructional practice section"
    sequence(:slug) { |n| "an-instructional-practice-section-#{n}" }
    content "This is a section in the introduction page."
    parent "instructional_practice"
  end

  factory :learn_more_section, class: UdlModuleSection do
    title "A learn more section"
    sequence(:slug) { |n| "a-learn-more-section-#{n}" }
    content "This is a section in the learn more page."
    parent "learn_more"
  end

  factory :references_section, class: UdlModuleSection do
    title "A references section"
    sequence(:slug) { |n| "a-references-section-#{n}" }
    content "This is a section in the references page."
    parent "references"
  end

end
