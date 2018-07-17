require 'spec_helper'

RSpec.describe UdlModuleSurvey do
  
  describe "validations" do
    it { should validate_presence_of(:udl_module) }
  end

  describe "associations" do
    it { should belong_to(:user) }
    it { should belong_to(:udl_module) }
    it { should belong_to(:udl_module_feedback) }
    it { should have_many(:user_category_udl_module_survey_associations).dependent(:destroy) }
    it { should have_many(:user_categories).through(:user_category_udl_module_survey_associations) }
  end
end
