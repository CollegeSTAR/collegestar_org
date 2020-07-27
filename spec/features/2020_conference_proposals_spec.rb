require 'rails_helper'

RSpec.feature "2020 Conference Proposals" do
  let(:proposal_attrs) { attributes_for(:virtual_conference_proposal) }
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
end
