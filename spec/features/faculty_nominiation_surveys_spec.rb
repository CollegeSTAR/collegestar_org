require 'spec_helper'

RSpec.feature "Faculty Nomination Surveys" do
  let(:college) { create(:institutional_college_with_departments) }
  let(:institutional_faculty) { create(:institutional_faculty) } # This is a hack, we're going to associate the faculty in the future

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
end
