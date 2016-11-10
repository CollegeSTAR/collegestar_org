require 'spec_helper'

RSpec.feature 'Page Content Management' do
  
  let(:admin_user) { create(:admin_user) } 

  feature "Add a page" do
    before(:each) do
      #login
      visit "/login"
      fill_in "Email", with: admin_user.email
      fill_in "Password", with: admin_user.password
      click_button "Log In"
    end

    context "With all correct information" do
      scenario do
        visit "/pages/new"
        fill_in "Title", with: "This is a page title"
        fill_in "Page URL", with: "new/page-content"
        fill_in "Page Content", with: "This is page content"
        click_button "Save Page Content"
        expect(page).to have_text("Page content created successfully.")
      end
    end
  end
end
