require 'spec_helper'

RSpec.feature 'Student Support Programs Resource' do
  let(:program_attributes) {  attributes_for(:student_support_program) }
  feature 'Program creation' do
    scenario "User submits a new program" do
      visit "/student-support-programs/new"
      fill_in "Name", with: program_attributes[:name]
      attach_file("Logo/Image", program_attributes[:logo]) 
      fill_in "Mission statement", with: program_attributes[:mission_statement]
      fill_in "Description of services", with: program_attributes[:description_of_services]
      fill_in "Program overview", with: program_attributes[:program_overview]
      select program_attributes[:program_size], from: "Program size"
      fill_in "Resources", with: program_attributes[:resources]
      fill_in "Contact info", with: program_attributes[:contact_info]
      check "Is this a public program?"
      check "Is this program fee-based?"
      select program_attributes[:program_cost], from: "What is the annual cost of this program?"
      fill_in "Target population", with: program_attributes[:target_population]
      select program_attributes[:institution_size], from: 'How large is your institution?'
      select program_attributes[:institution_type], from: 'Institution type'
      fill_in "Application proces", with: program_attributes[:application_process]

      click_button "Create Program"
      expect(page).to have_content(program_attributes[:name])
    end
  end
end
