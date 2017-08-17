FactoryGirl.define do
  factory :student_support_summit_registration do
    sequence(:program_name) { |n| "Test Program#{n}" }
    contact_name "John Smith"
    contact_email "john.smith@example.com"
    contact_phone "252-555-1234"
    institution "Test Institution"
    first_attendee_first_name "Jane"
    first_attendee_last_name "Doe"
    first_attendee_email "jane.doe@example.com"
    first_attendee_phone "252-555-4321"
    first_attendee_address "123 Anywhere Wy"
    first_attendee_city "Greenville"
    first_attendee_state "NC"
    first_attendee_zip "27858"
  end
end
