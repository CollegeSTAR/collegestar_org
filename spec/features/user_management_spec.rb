require 'spec_helper'

RSpec.feature "User management" do
  let(:campus) { create(:campus) }
  let(:user) { build(:user) }  
  before(:each) { campus }

  feature "create user" do 
    
    context "With correct information" do
      scenario "Creates a new User" do
        visit "/signup"

        fill_in 'First name', with: user.first_name
        fill_in 'Last name', with: user.last_name
        fill_in 'Email', with: user.email
        select  campus.name, from: 'Campus'
        fill_in 'Department', with: user.department
        fill_in 'Password', with: user.password
        fill_in 'Password confirmation', with: user.password_confirmation
        click_button 'Create Account'
        expect(page).to have_text("Thank you for signing up!")
      end
    end

    context "With incorrect information" do
      scenario "Halts user creation, displays error explanations" do
        visit "/signup"

        fill_in 'First name', with: ''
        fill_in 'Last name', with: user.first_name
        fill_in 'Email', with: user.email
        select  campus.name, from: 'Campus'
        fill_in 'Department', with: user.department
        fill_in 'Password', with: user.password
        fill_in 'Password confirmation', with: user.password_confirmation
        click_button 'Create Account'
        expect(page).to have_content("prohibited this user from being saved:")
      end    
    end
  end

  feature "edit one's user profile" do
    let(:user) { create(:user) }
    context "while logged in" do
      scenario "Edit user profile" do
        visit "/login"
        fill_in 'Email', with: user.email
        fill_in 'Password', with: user.password
        click_button 'Log In'
        
        visit "/profiles/#{user.id}/edit"
        fill_in 'First name', with: "NewFirstName"
        fill_in 'Last name', with: "NewLastName"
        fill_in 'Email', with: "new_email@example.com"
        click_button "Update Account Settings"
        expect(page).to have_content("NewFirstName NewLastName")
      end
    end
    context "while not logged in" do
      scenario "Edit user profile" do
        visit "/profiles/#{user.id}/edit"
        expect(page).to have_text("Log In")
      end
    end

    context "with non grantable role" do
      let(:admin_user) { create(:admin_user) }
      let(:admin_role) { create(:admin_role) }
      let(:news_articles_admin) { create(:news_articles_admin) }
      scenario "User updates profile" do
        visit "/login"
        fill_in 'Email', with: admin_user.email
        fill_in 'Password', with: admin_user.password
        click_button 'Log In'
        
        visit "/profiles/#{admin_user.id}/edit"
        click_button "Update Account"
        
        expect(page).to have_content("User's Roles")
      end
    end
  end
  
  feature "change one's password" do
    let(:user) { create(:user) }
    context "with correct current password" do
      scenario "User changes password" do
        visit "/login"
        fill_in "Email", with: user.email
        fill_in "Password", with: user.password
        click_button 'Log In'

        visit "/profiles/#{user.id}/edit"
        fill_in "Current password", with: user.password
        fill_in "New password", with: "new password"
        fill_in "New password confirmation", with: "new password"
        click_button "Change password"
        expect(page).to have_text("Successfully changed password.")
      end
    end
  end

  feature "View user index" do
    let(:admin) { create(:admin_user) }
    let(:user) { create(:user) }
    context "With correct authorization" do
      scenario "User logs in and views Users index" do
        user
        visit "/login"
        fill_in 'Email', with: admin.email
        fill_in 'Password', with: admin.password
        click_button 'Log In'

        visit "/users"
        expect(page).to have_content(user.first_name)
      end
    end
    context "Without correct authorization" do
      scenario "User logs in and views Users index" do  
        visit "/login"
        fill_in 'Email', with: user.email
        fill_in 'Password', with: user.password
        click_button 'Log In'

        visit "/users"
        expect(page).to_not have_text("Users")
      end
    end
  end
end
