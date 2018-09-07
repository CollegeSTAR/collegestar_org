require 'spec_helper'

RSpec.feature "Three Two One Video Proposals" do
  let(:proposal_attrs) { attributes_for(:three_two_one_video_proposal) }

  feature "Submit a new proposal" do
    scenario "User visits the new proposal page" do
      visit "/three-two-one-videos/proposals/new" 

      fill_in :three_two_one_video_proposal_first_name, with: proposal_attrs[:first_name]
      fill_in :three_two_one_video_proposal_last_name, with: proposal_attrs[:last_name]
      fill_in :three_two_one_video_proposal_email, with: proposal_attrs[:email]
      fill_in :three_two_one_video_proposal_institution, with: proposal_attrs[:institution]
      fill_in :three_two_one_video_proposal_title, with: proposal_attrs[:title]
      check :three_two_one_video_proposal_representation
      check :three_two_one_video_proposal_action_expression
      check :three_two_one_video_proposal_engagement
      fill_in :three_two_one_video_proposal_instructional_practice, with: proposal_attrs[:instructional_practice]
      click_button :three_two_one_video_proposal_submit

      expect(page).to have_content "Thanks for your proposal!"
    end
  end
end
