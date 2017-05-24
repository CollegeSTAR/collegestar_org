require 'spec_helper'

RSpec.describe UserModuleAssessment do
  
  describe "validations" do
    it { should validate_presence_of(:questions_order) }
  end

  describe "associations" do
    it { should belong_to(:user) }
    it { should belong_to(:udl_module) }
    it { should have_many(:user_assessment_answer_choice_associations) }
    it { should have_many(:answers).class_name("AssessmentAnswerChoice").through(:user_assessment_answer_choice_associations) }
  end
end
