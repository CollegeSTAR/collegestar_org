require 'rails_helper'

RSpec.feature "2020 Conference Proposals" do
  let(:proposal_1) { create(:virtual_conference_proposal) }
  let(:proposal_2) { create(:virtual_conference_proposal) }
  let(:proposal_attrs) { attributes_for(:virtual_conference_proposal) }
  let(:admin_user) { create(:admin_user) }
  
  scenario "User submits proposal" do
    visit "/virtual-conference-proposals/new"
    
    fill_in :virtual_conference_proposal_name, with: proposal_attrs[:name]
    fill_in :virtual_conference_proposal_email, with: proposal_attrs[:email]
    select "Theme One", from: :virtual_conference_proposal_presentation_theme
    fill_in :virtual_conference_proposal_presentation_title, with: proposal_attrs[:presentation_title]
    fill_in :virtual_conference_proposal_presentation_description, with: proposal_attrs[:presentation_description]
    fill_in :virtual_conference_proposal_presentation_takeaway, with: proposal_attrs[:presentation_takeaway]

    click_button "Submit Proposal"

    expect(page).to have_content("Virtual Conference Proposal successfully submitted!")
  end

  feature "Proposal Admin Management" do
    before(:each) do
      proposal_1
      proposal_2

      #login admin user
      visit "/login"
      fill_in "Email", with: admin_user.email
      fill_in "Password", with: admin_user.password
      click_button "Log In"
    end

    scenario "User views proposal index" do
    
      visit "/virtual-conference-proposals"

      expect(page).to have_content("#{proposal_1.presentation_title}")
      expect(page).to have_content("#{proposal_2.presentation_title}")
    end
  end

  feature "show page" do
    before(:each) do
      proposal_1

      #login admin user
      visit "/login"
      fill_in "Email", with: admin_user.email
      fill_in "Password", with: admin_user.password
      click_button "Log In"
    end

    scenario "User visits show page from index page link" do
      visit "/virtual-conference-proposals"
      click_link "#{proposal_1.presentation_title}"

      expect(page).to have_content("#{proposal_1.email}")
    end
  end
end
