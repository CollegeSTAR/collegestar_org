require 'spec_helper'

RSpec.feature "Event Management" do
  let(:admin_user) { create(:admin_user) }
  let(:event) { create(:event) }

  feature "index of events" do
    before(:each) { event }

    scenario "user visits events page"  do
      visit "/events"
      expect(page).to have_content(event.name)
    end
  end

  feature "display event information" do
    before(:each) { event }
    
    scenario "user visits event show view" do
      visit "/events/#{event.slug}"
      expect(page).to have_content(event.name)
    end
  end

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

  feature "edit event" do
    before(:each) do
      event
    end

    context "with correct user permissions" do
      
      before(:each) do
        #login
        visit "/login"
        fill_in "Email", with: admin_user.email
        fill_in "Password", with: admin_user.password
        click_button "Log In"
      end

      scenario "user edits event" do
        edited_event_name = "Edited event name"
        visit "/events/#{event.slug}"
        click_link "edit_event_link"
        
        fill_in "event_name", with: edited_event_name
        click_button "Update Event"

        expect(page).to have_content(edited_event_name)
      end
    end

    context "user attempts to edit event without correct user permissions" do
      scenario "user is redirected to login" do
        visit "/events/#{event.slug}/edit"
        expect(page).to have_content("Log In")
      end
    end
  end
end
