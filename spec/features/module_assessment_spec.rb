require 'spec_helper'

RSpec.feature "Module Assessment" do
  let(:udl_module_with_assessment) { create(:udl_module_with_assessment) }
  let(:non_module_question) { create(:assessment_question_with_answer_choices) }
  let(:module_admin) { create(:modules_admin_user) }
  let(:user) { create(:user) }
  
  feature "Create Assessment with module" do
    before(:each) do
      #login
      visit "/login"
      fill_in "Email", with: module_admin.email
      fill_in "Password", with: module_admin.password
      click_button "Log In"

      #create module
      visit "/modules/new"
      fill_in "Title", with: "My new module"
      fill_in "Sub heading", with: "My module's sub heading"
      fill_in "udl_module_description", with: "This is my description"
      check "Representation"
      click_button "Create Udl module"
    end

    scenario "Create a new module which creates 10 questions with 4 answer choices each" do
      visit "/modules/my-new-module/assessment/edit"

      expect(page).to have_selector(:css, "li.assessment-question", count: 10)
      expect(page).to have_selector(:css, "li.assessment-question-answer-choice", count: 40)
    end
  end

  feature "display assessment for each module" do
    scenario "User visits module assessment and sees questions" do
      visit "/modules/#{udl_module_with_assessment.slug}/assessment"
      expect(page).to have_css("div#udl_module_assessment_question_#{udl_module_with_assessment.assessment_questions.first.id}")
      expect(page).to_not have_css("div#udl_module_assessment_question_#{non_module_question.id}")
    end
  end

  feature "grade assessment" do
    before(:each) do
      #login
      visit "/login"
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
      click_button "Log In"
    end

    scenario "User visits module assessment, completes, and submits it" do
      visit "/modules/#{udl_module_with_assessment.slug}"
      visit "/modules/#{udl_module_with_assessment.slug}/assessment"
      
      #check correct answer of each question
      udl_module_with_assessment.assessment_questions.each do |question|
       choose "user_module_assessment_selected_answer_choices_#{question.id}_#{question.correct_answer_choice_id}"
      end
      click_button "Grade assessment"

      expect(page).to have_content("Assessment Results")
    end
  end
end
