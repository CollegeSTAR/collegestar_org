require 'spec_helper'

RSpec.feature 'DSS Contact Management' do
  
  let(:dss_contacts_admin) { create(:dss_contacts_admin_user) }
  let(:dss_contact) { create(:dss_contact) }

  before(:each) do
    #login
    visit "login"
    fill_in "Email", with: dss_contacts_admin.email
    fill_in "Password", with: dss_contacts_admin.password
    click_button "Log In"
  end

  scenario "visit index" do
    dss_contact
    visit "/disability-support-offices"
    expect(page).to have_text(dss_contact.campus_name)
  end

  scenario "visit show" do
    dss_contact
    visit "disability-support-offices/#{dss_contact.slug}"
    expect(page).to have_text(dss_contact.campus_name)
  end

  scenario "delete contact" do
    visit "/disability-support-offices/#{dss_contact.slug}/edit"
    click_link 'Delete DSS Contact'
    expect(page).to have_text("Successfully deleted DSS contact.")
  end

  context "with valid information" do
    scenario "Create a new contact" do
      visit "/disability-support-offices/new"
      select "Community College", from: "dss_contact_institution_type"
      fill_in "Campus name", with: "My Community College"
      fill_in "Name of DSS Office", with: "Disability Support Services"
      fill_in "Description of services", with: "This is the stuff that this office does."
      fill_in "Contact person", with: "John J. Smith"
      fill_in "Contact email", with: "johnsmith@example.com"
      fill_in "Contact phone number", with: "123-456-7890"
      fill_in "Dss website", with: "www.communitycollege.edu/disability-support-services"
      click_button "Add new DSS Office"
      expect(page).to have_text("Successfully created DSS contact.")
    end

    scenario "Edit contact" do
      visit "/disability-support-offices/#{dss_contact.slug}/edit"
      fill_in "Contact person", with: "Jane D. Doe"
      click_button "Update DSS Office"
      expect(page).to have_text("Successfully updated DSS contact.")
    end
  end
end
