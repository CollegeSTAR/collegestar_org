require 'spec_helper'

RSpec.feature "Case Study Proposal Management" do
  let(:admin_user) { create(:admin_user) }
  let(:case_study_proposal) { create(:case_study_proposal) }
  
  feature "Case Study Proposal Creation" do
    scenario "visit from old url" do
      visit "/module-proposals/new"

      expect(current_path).to eq("/case-study-proposals/new")
    end

    scenario "new case study proposal" do
      #we need this for time fields below
      time = Time.now

      visit "/case-study-proposals/new"
      fill_in "First Name", with: "Tanner"
      fill_in "Last Name", with: "Jones"
      fill_in "Email", with: "jonesjoe@example"
      fill_in "University", with: "East Carolina University"
      fill_in "Department", with: "English"
      fill_in "Proposed Title", with: "My Module Idea"
      fill_in "description of the proposed content", with: "My description"
      fill_in "pedagogical strategy link to UDL", with: "Stragey Link"
      fill_in "estimated start date", with: "#{time.year}-#{time.month}-#{time.day}"      
      time += 86400
      fill_in "estimated completion date", with: "#{time.year}-#{time.month}-#{time.day}"
      click_button "Submit Proposal"
      expect(page).to have_text("Case Study Proposal Received")
    end
  end

  feature "Module Proposal Edit" do
    scenario "edit a proposal" do
      visit "/login"
      fill_in "Email", with: admin_user.email
      fill_in "Password", with: admin_user.password
      click_button "Log In"

      visit "/case-study-proposals/#{case_study_proposal.id}/edit"
      fill_in "First Name", with: "NewFirstName"
      click_button "Save Proposal"

      expect(page).to have_text("NewFirstName")
    end

    scenario "accept a proposal" do
      visit "/login"
      fill_in "Email", with: admin_user.email
      fill_in "Password", with: admin_user.password
      click_button "Log In"

      visit "/case-study-proposals/#{case_study_proposal.id}"
      click_button "Accept Proposal"

      expect(page).to have_text("Proposal Accepted")
    end
  end
end
