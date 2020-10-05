require 'rails_helper'

RSpec.feature "2020 Virtual Conference Sessions" do
  let(:session) { create(:virtual_conference_session) }
  scenario "create new session" do
    visit "/virtual-conference/sessions/new"

    expect(page).to have_content("Add a New Virtual Conference Session")
  end

  before(:each) do
    
  end

end
