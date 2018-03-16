require 'spec_helper'

RSpec.describe AddAssessmentToModuleHistory do
  let(:udl_module_id) { 1 } 
  let(:user) { instance_double("User", find_module_history_by: user_module_history) }
  let(:assessment_assoc) { double("assessments") }
  let(:user_module_history) { instance_double("UserModuleHistory", udl_module_id: udl_module_id, assessments: assessment_assoc) }
  let(:assessment) { instance_double("UserModuleAssessment",  udl_module_id: udl_module_id) }
  let(:context) { AddAssessmentToModuleHistory.call( user: user, assessment: assessment)
  }

  describe "call" do

    it "fetches the users' module history for a given module" do
      allow(assessment_assoc).to receive(:<<)
      expect(user).to receive(:find_module_history_by).with(udl_module_id: udl_module_id)
      context.call
    end

    it "adds the assessment to the user module history" do
      expect(assessment_assoc).to receive(:<<).with(assessment)
      context.call
    end
  end
end
