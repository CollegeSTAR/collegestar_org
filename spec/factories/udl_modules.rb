FactoryBot.define do
  factory :udl_module do
    module_type { UdlModule::ModuleType::UDL_MODULE }
    sequence(:title) { |n| "Test Module #{n}" }
    sub_heading { 'testing modules all the time' }
    udl_representation { '1' }
    udl_action_expression { '1' }
    udl_engagement { '0' }
    description { 'This is a test module used to test modules...' }
    released { true }
    
    factory :udl_module_with_sections do
      after(:create) do |udl_module|
        udl_module.sections << create(:introduction_section)
        udl_module.sections << create(:udl_alignment_section)
        udl_module.sections << create(:instructional_practice_section)
        udl_module.sections << create(:learn_more_section)
        udl_module.sections << create(:references_resources_section)
      end
    end

    factory :udl_module_with_author do
      after(:create) do |udl_module|
        udl_module.authors << create(:modules_author_user)
      end
    end

    factory :udl_module_with_assessment do
      after(:create) do |udl_module|
        10.times do
          udl_module.assessment_questions << create(:assessment_question_with_answer_choices)
        end
      end
    end
  end

  factory :new_udl_module, class: UdlModule do
    module_type { UdlModule::ModuleType::UDL_MODULE }
    title { "test" }
    slug { "test" }
    sub_heading { "My sub heading" }
    udl_representation { "1" }
    udl_action_expression { "1" }
    udl_engagement { "0" }
    description { "Test description" }
  end

  factory :case_study, class: UdlModule do
    module_type { UdlModule::ModuleType::CASE_STUDY }
    title { "test" }
    slug { "test" }
    sub_heading { "My sub heading" }
    udl_representation { "1" }
    udl_action_expression { "1" }
    udl_engagement { "0" }
    description { "Test description" }
  end
end
