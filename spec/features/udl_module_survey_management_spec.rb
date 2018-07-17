require 'spec_helper'

RSpec.feature "UdlModuleSurvey Management" do
  
  let(:udl_mod) { create(:udl_module) }
  let(:user_category) { create(:user_category) }

  feature "Taking a Module Feedback Survey" do
    before(:each) do
      user_category
    end
    scenario "user visits survey page" do
      visit "/modules/#{udl_mod.slug}/feedback-surveys/new" 

      check "udl_module_survey_user_categories_#{user_category.id}"
      
      choose "udl_module_survey_length_of_time_satisfied"
      choose "udl_module_survey_organization_of_module_very_satisfied"
      choose "udl_module_survey_quality_of_content_satisfied"
      choose "udl_module_survey_relevance_to_my_needs_very_satisfied"
      choose "udl_module_survey_plan_to_implement_yes_need_more_info"
      choose "udl_module_survey_likely_to_recommend_likely"
      choose "udl_module_survey_access_another_module_likely"
      fill_in "udl_module_survey_additional_feedback", with: "This is my additional feedback!"

      click_button "udl_module_survey_submit_button"
      expect(page).to have_content("Successfully completed survey!")
    end
  end
end
