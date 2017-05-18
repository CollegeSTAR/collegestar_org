require 'spec_helper'

RSpec.feature "Faculty Nomination Surveys" do
  let(:college) { create(:institutional_college_with_departments) }
  let(:institutional_faculty) { create(:institutional_faculty) } # This is a hack, we're going to associate the faculty in the future
  let(:survey) { create(:faculty_nomination_survey) }
  let(:admin_user) { create(:admin_user) }

  feature "Submit surveys" do
    scenario "User visits survey" do
      institutional_faculty # Right now we just grab the first faculty member and assign them to this record. In the future the user
                            # will select a faculty member from a list of faculty and associate them to the record that way.
                            # Right now, the database has a foreign key constraint on this column and we must provide it a record.
      visit "/campuses/#{college.campus.slug}/faculty-nomination-surveys/new"

      check("Please include my name in communication to the faculty member I featured in my strategy nomination.")
      fill_in "Student name", with: "John Doe"
      fill_in "Student email", with: "john.doe.example.edu"

      fill_in "faculty_nomination_survey_faculty_first_name", with: "Jane"
      fill_in "faculty_nomination_survey_faculty_last_name", with: "doe"
      select college.departments.first.name, from: "faculty_nomination_survey_department_id"

      fill_in "1. What would you call the teaching strategy?", with: "The strategy"
      fill_in "2. Describe the instructional strategy, technique, or routine. Please be as specific as possible.", with: "Strategy description."
      fill_in "Why did you find this strategy, technique, or routine to be effective for you? Please be as specific as possible.", with: "Because it is effective"

      choose "Male"
      select "25-34", from: "What is your age?"
      
      click_button "Submit Survey"

      expect(page).to have_content("Thanks for your nomination!")
    end
  end
  
  context "while logged in" do
    before(:each) do
      visit "/login"
      fill_in "Email", with: admin_user.email
      fill_in "Password", with: admin_user.password
      click_button "Log In"
    end

    feature "Surveys index" do
      scenario "visit index page" do
        survey
        visit "/campuses/#{college.campus.slug}/faculty-nomination-surveys"

        expect(page).to have_content("Faculty Nomination Surveys")
        expect(page).to have_content(survey.faculty_first_name)
      end
    end

    feature "View individual survey" do
      scenario "User visits a survey page" do
        survey
        visit "/campuses/#{college.campus.slug}/faculty-nomination-surveys/#{survey.id}"
        
        expect(page).to have_content(survey.teaching_strategy)
      end
    end
  end

  context "While not authorized" do
    feature "Surveys index" do
      scenario "visit index page" do
        survey
        visit "/campuses/#{college.campus.slug}/faculty-nomination-surveys"

        expect(page).to have_content("Password")
      end
    end

    feature "View individual survey" do
      scenario "User visits a survey page" do
        survey
        visit "/campuses/#{college.campus.slug}/faculty-nomination-surveys/#{survey.id}"
        
        expect(page).to have_content("Password")
      end
    end  
  end

  feature "view surveys" do
    context "while logged in" do
      before(:each) do
        #login
        visit "/login"
        fill_in "Email", with: admin_user.email
        fill_in "password", with: admin_user.password
        click_button "Log In"
        survey
        college
      end

      scenario "user navigates to survey edit page and adds a quote" do
        visit "/campuses/#{college.campus.slug}/faculty-nomination-surveys/#{survey.id}"
        click_link "edit_faculty_nomination_survey_#{survey.id}_link"

        fill_in "faculty_nomination_survey_quotes", with: "A quote"
        check "faculty_nomination_survey_reviewed"
        click_button "Update survey"

        expect(page).to have_content( "A quote" )
        expect(page).to have_checked_field( "faculty_nomination_survey_reviewed" )
      end
    end
    context "while not logged in" do
      before(:each) do
        survey
        college
      end

      scenario "user navigates to survey's edit page" do
        visit "/campuses/#{college.campus.slug}/faculty-nomination-surveys/#{survey.id}/edit"

        expect(page).to have_content("Log In")
      end
    end
  end
end
