require "spec_helper"

RSpec.describe UserCategoryUdlModuleSurveyAssociation do
  
  describe "validations" do
    it { should validate_presence_of(:user_category) }
    it { should validate_presence_of(:udl_module_survey) }
  end

  describe "associations" do
    it { should belong_to(:user_category) }
    it { should belong_to(:udl_module_survey) }
  end
end
