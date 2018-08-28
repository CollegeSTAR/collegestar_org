require 'spec_helper'

RSpec.feature "Event Management" do
  let(:admin_user) { create(:admin_user) }
  let(:event) { create(:event) }

  feature "Create an event" do
    before(:each) do
      #login
      visit "/login"
      fill_in :email, with: admin_user.email
      fill_in :password, with: admin_user.password

      click_button "Log In"
    end

    scenario "User creates an event" do
      visit "/events/new"

      fill_in :event_name, with: event.name
      click_button "event_submit"

      expect(page).to have_content("Event was successfully created")
    end
  end
end
