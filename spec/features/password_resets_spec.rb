require 'spec_helper'

RSpec.feature "Password Resets" do
  
  feature "Create new password reset" do
    
    let (:user) { create(:user) }
    
    context "with existing user" do
      scenario "request password reset" do
        visit "/password-resets/new"

        fill_in "Email", with: user.email
        click_button "Request password reset instructions"
        expect(page).to have_text("An email has been sent to the provided email address with reset instructions. Thank you.")
      end
    end
    context "with non-existing user" do
      scenario "request password reset" do
        visit "/password-resets/new"

        fill_in "Email", with: "not_a_user@example.com"
        click_button "Request password reset instructions"
        expect(page).to have_text("We do not have an account matching the email address provided.")
      end
    end
  end
end
