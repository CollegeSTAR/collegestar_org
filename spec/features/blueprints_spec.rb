require 'spec_helper'

RSpec.feature "Blueprint documents" do
  let(:blueprint_index_content) { create(:blueprints_page) }

  describe "Blueprints index" do
    before(:each) do
      blueprint_index_content
    end
    scenario "user visits blueprints index" do
      visit "/blueprints"
      expect(page).to have_content("College STAR Blueprints")
    end
  end
end
