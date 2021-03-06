require 'spec_helper'

RSpec.feature "Student Support Summit Registrations" do
  let(:admin_user) { create(:admin_user) }
  let(:registration_attributes) { attributes_for(:student_support_summit_registration) }
  let(:registration) { create(:student_support_summit_registration) }

  context "Not logged in" do
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
        fill_in :student_support_summit_registration_shared_resource, with: registration_attributes[:shared_resource]
        fill_in :student_support_summit_registration_shared_problem, with: registration_attributes[:shared_problem]

        click_button 'Complete registration'

        expect(page).to have_content('Student Support Summit registration complete!');
      end
    end

    feature "redirects to summit info page" do
      scenario "User attempts to view registration index" do
        visit "/student-support-summit/registrations"

        expect(page).to have_current_path(student_support_summit_path)
      end
    end
  end

  context "Logged in as an admin" do
    before(:each) do
      #login
      visit "/login"
      fill_in "Email", with: admin_user.email
      fill_in "Password", with: admin_user.password
      click_button "Log In"

      registration
    end
    feature "List all registrations" do
      scenario "User visits registration index" do
        visit "/student-support-summit/registrations"

        expect(page).to have_content(registration.program_name)
      end
    end

    feature "Show individual registration" do

      scenario "User clicks on registration link from index" do
        visit "/student-support-summit/registrations"
        click_link "student_support_summit_registration_#{registration.id}"

        expect(page).to have_content(registration.program_name)
        expect(page).to have_content(registration.first_attendee_first_name)
        expect(page).to have_content(registration.second_attendee_first_name)
        expect(page).to have_content(registration.shared_resource)
        expect(page).to have_content(registration.shared_problem)
      end
    end
  end
end
