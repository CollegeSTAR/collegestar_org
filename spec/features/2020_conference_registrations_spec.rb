require 'rails_helper'

RSpec.feature "VirtualConferenceRegistration Management" do
  let(:reg_attrs) { attributes_for(:virtual_conference_registration) } 
  feature "New registrations" do
    scenario "User visits registration page and fills out form" do
      visit "/virtual-conference-registrations/new"
      
      fill_in :virtual_conference_registration_first_name, with: reg_attrs[:first_name]
      fill_in :virtual_conference_registration_last_name, with: reg_attrs[:last_name]
      fill_in :virtual_conference_registration_email, with: reg_attrs[:email]
      select "North Carolina", from: 'virtual_conference_registration_state'
      select "10", from: "virtual_conference_registration_number_of_participants"
      
      click_button :virtual_conference_registration_form_submit
      
      expect(page).to have_content("Virtual Conference Registration submitted successfully!")
      expect(page).to have_content("#{reg_attrs[:first_name]} #{reg_attrs[:last_name]}")
    end
  end
end
