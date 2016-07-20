require 'spec_helper'

RSpec.feature "User Session Management" do
  let(:user) { create(:user) }
  
  feature "Create Sessions" do
    context "with correct credentials" do
      scenario "user logs in" do
        visit "/login"

        fill_in "Email", with: user.email
        fill_in "Password", with: user.password
        click_button "Log In"
        expect(page).to have_content "Welcome to College STAR"
      end
    end
    context "with incorrect credentials" do
      scenario "user logs in" do
        visit "/login"

        fill_in "Email", with: "not_a_user@example.com"
        fill_in "Password", with: "not_a_correct_password"
        click_button "Log In"
        expect(page).to have_content "Incorrect username and/or password, please try again."
      end
    end
  end
end
