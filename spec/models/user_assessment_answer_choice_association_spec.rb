require 'spec_helper'

RSpec.describe UserAssessmentAnswerChoiceAssociation do
  
  describe "associations" do
    it { should belong_to(:user_module_assessment) }
    it { should belong_to(:assessment_answer_choice) }
  end
end
