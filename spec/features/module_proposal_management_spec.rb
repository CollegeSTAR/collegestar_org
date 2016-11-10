require 'spec_helper'

RSpec.feature "Module Proposal Management" do
  
  feature "Module Proposal Creation" do
    
    scenario "new module proposal" do
      #we need this for time fields below
      time = Time.now

      visit "/module-proposals/new"
      fill_in "First Name", with: "Tanner"
      fill_in "Last Name", with: "Jones"
      fill_in "Email", with: "jonesjoe@example"
      fill_in "University", with: "East Carolina University"
      fill_in "Department", with: "English"
      fill_in "Proposed Module Title", with: "My Module Idea"
      fill_in "description of the proposed content", with: "My description"
      fill_in "estimated start date", with: "#{time.year}-#{time.month}-#{time.day}"      
      time += 86400
      fill_in "estimated completion date", with: "#{time.year}-#{time.month}-#{time.day}"
      click_button "Submit Module Proposal"
      expect(page).to have_text("Module Proposal Received")
    end
  end
end
