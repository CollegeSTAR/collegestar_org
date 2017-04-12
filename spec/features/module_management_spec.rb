require 'spec_helper'

RSpec.feature "Module Management" do
  let(:udl_module) { create(:udl_module) }
  let(:module_admin) { create(:modules_admin_user) }

  feature "list all modules" do
    before(:each) do
      udl_module
      #login
      visit "/login"
      fill_in "Email", with: module_admin.email
      fill_in "Password", with: module_admin.password
      click_button "Log In"
    end

    scenario "visit udl modules page" do
      visit "/modules"
      
      expect(page).to have_content(udl_module.title)
    end
  end

  feature "add section to module" do
    before(:each) do 
      #login
      visit "/login"
      fill_in "Email", with: module_admin.email
      fill_in "Password", with: module_admin.password
      click_button "Log In"
    end
    
    context "with a title" do
      scenario "add section" do
        visit "/modules/#{udl_module.slug}/sections/new?parent=introduction"
        fill_in "Title", with: "This is the section title"
        fill_in "udl_module_section_content", with: "This is the content"
        click_button "Save section"
        expect(page).to have_text("successfully created.")
      end
    end
    context "without a title" do
      scenario "add section" do
        visit "/modules/#{udl_module.slug}/sections/new?parent=introduction"
        fill_in "udl_module_section_content", with: "This is the content"
        click_button "Save section"
        expect(page).to_not have_text("successfully created.")
        expect(page).to have_css(".field_with_errors")
      end
    end
  end
end
