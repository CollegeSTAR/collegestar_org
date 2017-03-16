require 'spec_helper'

RSpec.feature "Institutional College Management" do
  

  feature "Institutional College index" do
    let(:institutional_college) { create(:institutional_college) }

    scenario "visit index page for a campus" do
      visit "/campuses/#{institutional_college.campus.slug}/colleges"

      expect(page).to have_content(institutional_college.name)
    end
  end
end
