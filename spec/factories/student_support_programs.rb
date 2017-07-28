FactoryGirl.define do
  factory :student_support_program do
    sequence(:name) { |n| "Student Support Program #{n}" }
    sequence(:slug) { |n| "student-support-program-#{n}" }
    mission_statement "The mission statement"
    description_of_services "The services we provide"
    program_overview "The overview"
    program_size "0-24"
    resources "These are the resources"
    contact_info "My name and address and phone number"
    program_cost "$1,000-$2,999"
    target_population "ADHD"
    institution_size '1,000-9,999'
    institution_type 'State'
    application_process "This is how you apply to our program:"
  end
end
