require 'spec_helper'

RSpec.feature "Event Management" do

  feature "add new event" do 

    let (:events_admin) {create (:events_admin_user)}
  
    before(:each) do
    
      visit "/login"
      fill_in "Email" , with: events_admin.email
      fill_in "Password" , with: events_admin.password
      click_button "Log In"
    end 

    context "with a name, slug, address, city and zip code" do
      scenario "add a new event" do
      	visit "/events/new"
        fill_in "Name", with: "This is the event name"
        fill_in "Slug", with: "This is the event slug"
        fill_in "Address", with: "This is the event address"
        fill_in "City", with: "This is the event city"
        fill_in "Zip code", with: "This is the event zip code" 
        click_button "Create Event"
        expect(page).to have_text("Event was successfully created.")
      end
    end
    context "without an address" do
      scenario "add a new event" do
        visit "/events/new"
        fill_in "Name", with: "This is the event name"
        fill_in "Slug", with: "This is the event slug"
        fill_in "City", with: "This is the event city"
        fill_in "Zip code", with: "This is the event zip code"
        click_button "Create Event"
        expect(page).to have_css(".field_with_errors")
      end
    end
  end
end

#to test in command line run $bin/rspec
