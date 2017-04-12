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
  
  factory :shared_introduction_section, class: UdlModuleSection do
    title "A shared introduction section"
    sequence(:slug) { |n| "a-shared-introduction-section-#{n}" }
    content "This is a shared section in the introduction page."
    parent "introduction"
    shared true
    default_shared_position 1
  end
 
  factory :shared_udl_alignment_section, class: UdlModuleSection do
    title "A shared Udl Alignment section"
    sequence(:slug) { |n| "a-shared-udl-alignment-section-#{n}" }
    content "This is a shared section in the UDL Alignment page."
    parent "udl_alignment"
    shared true
    default_shared_position 1
  end

  factory :shared_instructional_practice_section, class: UdlModuleSection do
    title "A shared instructional practice section"
    sequence(:slug) { |n| "a-shared-instructional-practice-section-#{n}" }
    content "This is a shared section in the instructional practice page."
    parent "instructional_practice"
    shared true
    default_shared_position 1
  end
  
  factory :shared_literature_base_section, class: UdlModuleSection do
    title "A shared literature base section"
    sequence(:slug) { |n| "a-shared-literature-base-section-#{n}" }
    content "This is a shared section in the literature base page."
    parent "literature_base"
    shared true
    default_shared_position 1
  end  
  
  factory :shared_learn_more_section, class: UdlModuleSection do
    title "A shared learn more section"
    sequence(:slug) { |n| "a-shared-learn-more-section-#{n}" }
    content "This is a shared section in the learn more page."
    parent "learn_more"
    shared true
    default_shared_position 1
  end  
  
  factory :shared_references_and_resources_section, class: UdlModuleSection do
    title "A shared references and resources section"
    sequence(:slug) { |n| "a-shared-references-and-resources-section-#{n}" }
    content "This is a shared section in the references and resources page."
    parent "references_and_resources"
    shared true
    default_shared_position 1
  end
end
