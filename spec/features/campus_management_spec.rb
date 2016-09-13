require 'spec_helper'

RSpec.feature "Campus Management" do

  feature "add new campus" do 

    let (:campus_admin) {create (:campus_admin_user)}
  
    before(:each) do
    
      visit "/login"
      fill_in "Email" , with: campus_admin.email
      fill_in "Password" , with: campus_admin.password
      click_button "Log In"
    end 

    context "with a campus name, slug, and abbreviation" do
      scenario "add a new campus" do
      	visit "/campuses/new"
        fill_in "Name" , with: "This is the campus name"
        fill_in "Slug", with: "This is the campus slug"
        fill_in "Abbreviation", with: "This is the campus abbreviation"
        click_button "Create Campus"
        expect(page).to have_text("Campus was successfully created.")
      end
    end
    context "without a title and content" do
      scenario "add a new campus" do
        visit "/campuses/new"
        fill_in "Slug", with: "This is the campus slug"
        fill_in "Abbreviation", with: "This is the campus abbreviation"
        click_button "Create Campus"
        expect(page).to have_css(".field_with_errors")
      end
    end
  end
end

#to test in command line run $bin/rspec

