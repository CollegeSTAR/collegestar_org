require 'spec_helper'

RSpec.feature "Think UDL Management" do 

  feature "Displays episode info" do
    scenario "user visits /think-udl-podcast" do
      visit "think-udl-podcast"

      expect(page).to have_content("Think UDL Podcast")
    end
  end
end
