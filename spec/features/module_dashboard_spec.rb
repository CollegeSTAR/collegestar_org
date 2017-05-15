require 'spec_helper'

RSpec.feature "UDL Module Editor" do
  let(:module_attributes) { attributes_for(:udl_module) }
  let(:modules_author) { create(:modules_author_user) }
  
  feature "display index of user's modules" do
    context "without correct permissions" do
      scenario "user visits a module dashboard" do
        modules_author
        visit "/profiles/#{modules_author.id}/modules-dashboard"
        expect(page).to have_content("Log In")
      end
    end

    context "with existing authored modules" do
      before(:each) do
        visit "/login"
        fill_in "Email", with: modules_author.email
        fill_in "Password", with: modules_author.password
        click_button "Log In"

        visit '/modules/new'
        fill_in "Title", with: module_attributes[:title]
        fill_in "Sub heading", with: module_attributes[:sub_heading]
        fill_in "udl_module_description", with: module_attributes[:description]
        check "udl_module_udl_representation"
        click_button "Create Udl module"

      end

      scenario "user visits her module editor" do
        visit "/profiles/#{modules_author.id}/modules-dashboard"
        expect(page).to have_content(module_attributes[:title])
      end
    end
  end
end
