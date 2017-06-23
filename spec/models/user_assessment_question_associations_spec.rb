require 'spec_helper'

RSpec.describe UserAssessmentQuestionAssociation do
  subject { create(:user_assessment_question_association) }
  
  describe "validations" do
    it { should validate_presence_of(:user_module_assessment) }
    it { should validate_presence_of(:assessment_question) }
    it { should validate_presence_of(:position) }
  end

  describe "associations" do
    it { should belong_to(:user_module_assessment) }
    it { should belong_to(:assessment_question) }
    it { should belong_to(:selected_answer).class_name("AssessmentAnswerChoice").with_foreign_key("selected_answer_id")}
  end
end
