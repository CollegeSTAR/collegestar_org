require 'spec_helper'

RSpec.feature "Faculty Redesign Management" do

  feature "add new redesign summary" do
    let(:redesign_summaries) { create(:redesign_summaries) }
    let(:redesign_summaries_admin) { create(:redesign_summaries_admin_user) }
    before(:each) do 
      #login
      visit "/login"
      fill_in "Email", with: redesign_summaries_admin.email
      fill_in "Password", with: redesign_summaries_admin.password
      click_button "Log In"
    end
    
    context "with principle technique and Redesign process addressed" do
      scenario "add new summary" do
        visit "/profiles/1/redesign-summaries/new"
        fill_in "ReDesign Process:", with: "This is the ReDesign Process"
        check "Multiple Means of Representation"
        click_button "Save redesign summary"
        expect(page).to have_text("Redesign summary created successfully.")
      end
    end
    context "without a principle technique or redesign process addressed" do
      scenario "add new summary" do
        visit "/profiles/1/redesign-summaries/new"
        click_button "Save redesign summary"
        expect(page).to_not have_text("Redesign summary created successfully.")
        expect(page).to have_text("You must select at least one UDL Principle")
      end
    end
  end
end