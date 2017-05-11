require 'spec_helper'

RSpec.feature "Campus Management" do
  let (:campus) { create(:campus) }
  let (:campus_admin) {create (:campus_admin_user)}

  feature "list index of campuses" do
    before(:each) do
      visit "/login"
      fill_in "Email" , with: campus_admin.email
      fill_in "Password" , with: campus_admin.password
      click_button "Log In"

      campus
    end 

    scenario "user visits campuses index page" do
      visit "/campuses"
      expect(page).to have_content(campus.name)
    end
  end

  feature "display a campus" do
    scenario "user visits a campus view" do
      visit "/campuses/#{campus.slug}"
      expect(page).to have_content(campus.name)
    end
  end

  feature "add new campus" do 

  
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

  feature "edit a campus" do
    before(:each) { campus }
    context "with correct user permissions" do
      before(:each) do
        #login
        visit "/login"
        fill_in "Email", with: campus_admin.email
        fill_in "Password", with: campus_admin.password
        click_button "Log In"
      end
      scenario "user edits a campus" do
        edited_campus_name = "Edited campus name"
        visit "/campuses"
        click_link "edit_campus_#{campus.slug.underscore}_link"
        fill_in "campus_name", with: edited_campus_name
        click_button "Update Campus"

        expect(page).to have_content(edited_campus_name)
      end
    end
    context "with incorrect user permissions" do
      scenario "user attempts to edit campus" do
        visit "/campuses/#{campus.slug}/edit"
        expect(page).to have_content( "Log In" )
      end
    end
  end
end
