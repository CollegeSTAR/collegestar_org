require 'spec_helper'

RSpec.feature "Udl Module History" do
  let (:user) { create(:user) }
  let (:udl_module) { create(:udl_module_with_assessment) }

  feature "Visiting a module creates a module history entry" do
    context "while logged in" do
      before(:each) do
        #login
         visit "/login"
         fill_in "Email", with: user.email
         fill_in "Password", with: user.password
         click_button "Log In"
      end

      #visit a module
      scenario "user visits a module" do
        visit "/modules/#{udl_module.slug}"
        visit "/profiles/#{user.id}/module-history"
        expect(page).to have_content(udl_module.title)
      end
    end

    context "while not logged in" do
      scenario "user visits a module" do
        visit "/modules/#{udl_module.slug}"
        visit "/profiles/#{user.id}/module-history"
        expect(page).to have_content("Log In")
      end
    end
  end
end
