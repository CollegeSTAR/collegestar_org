require 'spec_helper'

RSpec.feature "Media Consents" do
  let(:admin) { create(:admin_user) }

  context "as admin" do
    before(:each) do
      visit "/login"
      fill_in "email", with: admin.email
      fill_in "password", with: admin.password
      click_button "Log In"
    end

    it "displays all media consents" do
      visit "/student-support-summit/media-consents"

      expect(page).to have_content("Student Support Summit Media Consents")
    end
  end
  
  context "not admin" do
    it "redirects to summit index when accessing media consent index" do
      visit "/student-support-summit/media-consents"

      expect(page).to have_content("2017 Student Support Summit")
      expect(page).to have_content("You are not authorized to perform this action")
    end

    context "With correct information" do
      it "Submit new media consent" do
        visit "/student-support-summit/media-consents/new"
        fill_in "media_consent_first_name", with: "John"
        fill_in "media_consent_last_name", with: "Smith"
        attach_file( "media_consent_image", Rails.root + "spec/fixtures/upload.png")
        check "media_consent_consent"

        click_button "Certify"
        
        expect(page).to have_content("2017 Student Support Summit")
        expect(page).to have_content("Successfully submitted media consent, thank you!")
      end
    end

    context "With missing required field" do
      it "Submit new media consent" do
        visit "/student-support-summit/media-consents/new"
        fill_in "media_consent_first_name", with: "John"
        fill_in "media_consent_last_name", with: "Smith"
        check "media_consent_consent"

        click_button "Certify"

        expect(page).to have_content('There was an error submitting your media, consent, please try again.')
      end
    end
  end
end
