require 'spec_helper'

RSpec.feature "Student Support Summit Questionnaires" do
  let(:questionnaire) { create(:student_support_summit_questionnaire) }
  let(:admin) { create(:admin_user) }

  context "While logged in as an admin" do

    before(:each) do
      #login
      visit "/login"
      fill_in "email", with: admin.email
      fill_in "password", with: admin.password
      click_button "Log In"
    end
    
    feature "display completed questionnaires" do
      before(:each) do
        #create a questionnaire
        questionnaire
      end
      scenario "Visit index page" do
        visit "/student-support-summit/questionnaires"

        expect(page).to have_content("2017 Student Support Summit Questionnaires")
        expect(page).to have_content(questionnaire.first_name)
      end
    end

    feature "display selected questionnaire" do
      before(:each) do
        questionnaire
      end
      scenario "visit a questionnaire" do
        visit "/student-support-summit/questionnaires/#{questionnaire.id}"

        expect(page).to have_content(questionnaire.first_name)
        expect(page).to have_content(questionnaire.last_name)
        expect(page).to have_content(questionnaire.email)
        expect(page).to have_content(questionnaire.most_excited_about)
        expect(page).to have_content(questionnaire.issues)
        expect(page).to have_content(questionnaire.challenges)
        expect(page).to have_content(questionnaire.well_spent_time)
      end
    end
  end

  context "While not logged in" do
    before(:each) do
      questionnaire
    end
    feature "index redirects to summit index" do
      scenario "visit questionnaires index" do
        visit "/student-support-summit/questionnaires"

        expect(page).to have_content("You are not authorized to view this area")
        expect(page).to have_content("2017 Student Support Summit")
      end
    end
    
    feature "show redirects to summit index" do
      scenario "visit questionnaire show" do
        visit "/student-support-summit/questionnaires/#{questionnaire.id}"

        expect(page).to have_content("You are not authorized to view this area")
        expect(page).to have_content("2017 Student Support Summit")
      end
    end

    feature "submit a new questionnaire" do
      scenario "visit and complete new questionnaire form" do
        visit "/student-support-summit/questionnaires/new"

        fill_in "student_support_summit_questionnaire_first_name", with: questionnaire.first_name
        fill_in "student_support_summit_questionnaire_last_name", with: questionnaire.last_name
        fill_in "student_support_summit_questionnaire_email", with: questionnaire.email
        fill_in "student_support_summit_questionnaire_most_excited_about", with: questionnaire.most_excited_about
        fill_in "student_support_summit_questionnaire_issues", with: questionnaire.issues
        fill_in "student_support_summit_questionnaire_challenges", with: questionnaire.challenges
        fill_in "student_support_summit_questionnaire_well_spent_time", with: questionnaire.well_spent_time

        click_button "Submit Questionnaire"

        expect(page).to have_content("Questionnaire submitted successfully, thank you!")
      end
    end
  end
end
