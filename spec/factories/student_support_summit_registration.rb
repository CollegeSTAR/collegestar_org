FactoryBot.define do
  factory :student_support_summit_registration do
    sequence(:program_name) { |n| "Test Program#{n}" }
    contact_name { "John Smith" }
    contact_email { "john.smith@example.com" }
    contact_phone { "252-555-1234" }
    institution { "Test Institution" }
    first_attendee_first_name { "Jane" }
    first_attendee_last_name { "Doe" }
    first_attendee_email { "jane.doe@example.com" }
    first_attendee_phone { "252-555-4321" }
    first_attendee_address { "123 Anywhere Wy" }
    first_attendee_city { "Greenville" }
    first_attendee_state { "NC" }
    first_attendee_zip { "27858" }
    first_attendee_arrival_date { "2017-10-25" }
    first_attendee_departure_date { "2017-10-27" }
    first_attendee_travel_by { "Plane" }
    first_attendee_dietary_restrictions { "I have a restriction" }
    first_attendee_accessability_needs { "I have a need" }
    second_attendee_first_name { "Jane" }
    second_attendee_last_name { "Doe" }
    second_attendee_email { "jane.doe@example.com" }
    second_attendee_phone { "252-555-4321" }
    second_attendee_address { "123 Anywhere Wy" }
    second_attendee_city { "Greenville" }
    second_attendee_state { "NC" }
    second_attendee_zip { "27858" }
    second_attendee_arrival_date { "2017-10-25" }
    second_attendee_departure_date { "2017-10-27" }
    second_attendee_travel_by { "Car" }
    second_attendee_dietary_restrictions { "I have a restriction" }
    second_attendee_accessability_needs { "I have a need" }
    shared_resource { "This is my resource" }
    shared_problem { "This is my problem" }
  end
end
