require 'spec_helper'

RSpec.feature "Student Support Summit Registrations" do
  let(:registration_attributes) { attributes_for(:student_support_summit_registration) }
  let(:registration) { create(:student_support_summit_registration) }
  feature "Register for Summit" do
    scenario "user visits registration page and fills out form" do
      visit '/student-support-summit/registrations/new'
      fill_in :student_support_summit_registration_program_name, with: registration_attributes[:program_name]
      fill_in :student_support_summit_registration_contact_name, with: registration_attributes[:contact_name]
      fill_in :student_support_summit_registration_contact_email, with: registration_attributes[:contact_email]
      fill_in :student_support_summit_registration_contact_phone, with: registration_attributes[:contact_phone]
      fill_in :student_support_summit_registration_institution, with: registration_attributes[:institution]

      fill_in :student_support_summit_registration_first_attendee_first_name, with: registration_attributes[:first_attendee_first_name]
      fill_in :student_support_summit_registration_first_attendee_last_name, with: registration_attributes[:first_attendee_last_name]
      fill_in :student_support_summit_registration_first_attendee_email, with: registration_attributes[:first_attendee_email]
      fill_in :student_support_summit_registration_first_attendee_phone, with: registration_attributes[:first_attendee_phone]
      fill_in :student_support_summit_registration_first_attendee_address, with: registration_attributes[:first_attendee_address]
      fill_in :student_support_summit_registration_first_attendee_address_2, with: registration_attributes[:first_attendee_address_2]
      fill_in :student_support_summit_registration_first_attendee_city, with: registration_attributes[:first_attendee_city]
      fill_in :student_support_summit_registration_first_attendee_state, with: registration_attributes[:first_attendee_state]
      fill_in :student_support_summit_registration_first_attendee_zip, with: registration_attributes[:first_attendee_zip]
      fill_in :student_support_summit_registration_first_attendee_arrival_date, with: registration_attributes[:first_attendee_arrival_date]
      fill_in :student_support_summit_registration_first_attendee_departure_date, with: registration_attributes[:first_attendee_departure_date]
      select registration_attributes[:first_attendee_travel_by], from: :student_support_summit_registration_first_attendee_travel_by
      fill_in :student_support_summit_registration_first_attendee_dietary_restrictions, with: registration_attributes[:first_attendee_dietary_restrictions]
      fill_in :student_support_summit_registration_first_attendee_accessability_needs, with: registration_attributes[:first_attendee_accessability_needs]
     
      fill_in :student_support_summit_registration_second_attendee_first_name, with: registration_attributes[:second_attendee_first_name]
      fill_in :student_support_summit_registration_second_attendee_last_name, with: registration_attributes[:second_attendee_last_name]
      fill_in :student_support_summit_registration_second_attendee_email, with: registration_attributes[:second_attendee_email]
      fill_in :student_support_summit_registration_second_attendee_phone, with: registration_attributes[:second_attendee_phone]
      fill_in :student_support_summit_registration_second_attendee_address, with: registration_attributes[:second_attendee_address]
      fill_in :student_support_summit_registration_second_attendee_address_2, with: registration_attributes[:second_attendee_address_2]
      fill_in :student_support_summit_registration_second_attendee_city, with: registration_attributes[:second_attendee_city]
      fill_in :student_support_summit_registration_second_attendee_state, with: registration_attributes[:second_attendee_state]
      fill_in :student_support_summit_registration_second_attendee_zip, with: registration_attributes[:second_attendee_zip]
      fill_in :student_support_summit_registration_second_attendee_arrival_date, with: registration_attributes[:second_attendee_arrival_date]
      fill_in :student_support_summit_registration_second_attendee_departure_date, with: registration_attributes[:second_attendee_departure_date]
      select registration_attributes[:second_attendee_travel_by], from: :student_support_summit_registration_second_attendee_travel_by
      fill_in :student_support_summit_registration_second_attendee_dietary_restrictions, with: registration_attributes[:second_attendee_dietary_restrictions]
      fill_in :student_support_summit_registration_second_attendee_accessability_needs, with: registration_attributes[:second_attendee_accessability_needs]

      click_button 'Complete registration'

      expect(page).to have_content('Student Support Summit registration complete!');
    end
  end

  feature "List all registrations" do
    before(:each) do
      registration
    end
    scenario "User visits registration index" do
      visit "/student-support-summit-registrations"

      expect(page).to have_content(registration.program_name)
    end
  end
end
