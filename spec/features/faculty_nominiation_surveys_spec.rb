require 'spec_helper'

RSpec.feature "Faculty Nomination Surveys" do
  let(:campus) { create(:campus) }

  feature "Submit surveys" do

    scenario "User visits survey" do
      visit "/campuses/#{campus.slug}/faculty-nomination-surveys/new"

      expect(page).to have_content("Faculty Nomination Survey")
    end
  end
end
