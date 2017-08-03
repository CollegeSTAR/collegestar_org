require 'spec_helper'

RSpec.feature 'Student Support Programs Resource' do
  let(:program_attributes) {  attributes_for(:student_support_program) }
  let(:program) { create(:student_support_program) }
  let(:admin) { create(:admin_user) }
  let(:user) { create(:user) }
 
  context "Logged in with correct permissions" do
    before(:each) do
      visit "/login"
      fill_in "Email", with: admin.email
      fill_in "Password", with: admin.password
      click_button "Log In"
    end

    feature 'Program creation' do
      scenario "User submits a new program" do

        visit "/student-support-programs/new"
        fill_in "Name", with: program_attributes[:name]
        fill_in "Mission statement", with: program_attributes[:mission_statement]
        fill_in "Description of services", with: program_attributes[:description_of_services]
        fill_in "Program overview", with: program_attributes[:program_overview]
        select program_attributes[:program_size], from: "Program size"
        fill_in "Resources", with: program_attributes[:resources]
        fill_in "Contact info", with: program_attributes[:contact_info]
        check "Is this a public program?"
        check "Is this program fee-based?"
        select program_attributes[:program_cost], from: "What is the annual cost for students to participate in this program?"
        fill_in "student_support_program_target_population_other", with: "Target Population"
        select program_attributes[:institution_size], from: 'How large is your institution?'
        select program_attributes[:institution_type], from: 'Institution type'
        fill_in "Application proces", with: program_attributes[:application_process]

        click_button "Create Program"
        expect(page).to have_content(program_attributes[:name])
      end
    end

    feature "Program updating" do
      scenario "User edits existing Program" do
        new_mission_statement = "The new mission statement"

        visit "/student-support-programs/#{program.slug}/edit"
        fill_in "Mission statement", with: new_mission_statement 
        
        click_button "Update Program"
        expect(page).to have_content(new_mission_statement)
      end
    end
  end

  context "Logged in without correct permissions" do
    before(:each) do
      visit "/login"
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
      click_button "Log In"
    end

    feature "Program Creation" do
      scenario "User visits StudentSupportProgram#new" do
        visit "/student-support-programs/new"

        expect(page).to have_content("Forgot your password")
      end
    end
  end
end
