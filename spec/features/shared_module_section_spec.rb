require 'spec_helper'

RSpec.feature "Udl Module Shared Sections" do
  let(:module_admin) { create(:modules_admin_user) } 
  let(:shared_introduction_section) { create(:shared_introduction_section) }
  let(:udl_module_attributes) { attributes_for(:udl_module) }
  feature "Adding a shared section" do
    before(:each) do
      #login
      visit "/login"
      fill_in "Email", with: module_admin.email
      fill_in "Password", with: module_admin.password
      click_button "Log In"
    end

    scenario "user clicks Add Shared Section" do
      shared_section_title = "My shared section"
      visit "/modules"
      click_link("Add Shared Section")
      select "Introduction", from: "shared_module_section_parent"
      fill_in "shared_module_section_title", with: shared_section_title
      fill_in "shared_module_section_content", with: "My shared module section content"
      click_button "Create section"

      visit "/modules"

      expect(page).to have_content(shared_section_title)
    end
  end

  feature "Creating a shared section adds it to new modules" do
    before(:each) do
      #login
      visit "/login"
      fill_in "Email", with: module_admin.email
      fill_in "Password", with: module_admin.password
      click_button "Log In"

      shared_introduction_section
    end
    
    scenario "user creates a new module" do
      visit "/modules/new"
      fill_in "udl_module_title", with: udl_module_attributes[:title]
      fill_in "udl_module_sub_heading", with: udl_module_attributes[:sub_heading]
      fill_in "udl_module_description", with: udl_module_attributes[:description]
      check "udl_module_udl_representation"
      click_button("Create Udl module")

      expect(page).to have_content(shared_introduction_section.title)
    end
  end

  feature "Update existing shared section" do
    before(:each) do
      #login
      visit "/login"
      fill_in "Email", with: module_admin.email
      fill_in "Password", with: module_admin.password
      click_button "Log In"

      shared_introduction_section
    end

    scenario "user edits shared section" do
      shared_section_edited_content = "The new content"
      visit "/shared-module-sections/#{shared_introduction_section.slug}/edit"
      fill_in "shared_module_section_content", with: shared_section_edited_content
      click_button "Update section"

      expect(page).to have_content(shared_section_edited_content)
    end
  end

  feature "Delete existing shared section" do
    before(:each) do
      #login
      visit "/login"
      fill_in "Email", with: module_admin.email
      fill_in "Password", with: module_admin.password
      click_button "Log In"

      shared_introduction_section
    end

    scenario "user clicks delete this section" do
      visit "shared-module-sections/#{shared_introduction_section.slug}/edit"
      click_link "Delete this Section"

      expect(page).to_not have_content(shared_introduction_section.title)
    end
  end
end
