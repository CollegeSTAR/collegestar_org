require 'spec_helper'

RSpec.describe AddAssessmentToModuleHistory do
  let(:udl_module_id) { 1 } 
  let(:user) { instance_double("User", find_module_history_by: user_module_history) }
  let(:assessment_assoc) { double("assessments") }
  let(:user_module_history) { instance_double("UserModuleHistory", udl_module_id: udl_module_id, assessments: assessment_assoc) }
  let(:passing_assessment) { instance_double("UserModuleAssessment",  udl_module_id: udl_module_id, passed?: true) }
  let(:failing_assessment) { instance_double("UserModuleAssessment",  udl_module_id: udl_module_id, passed?: false) }
  let(:passing_assessment_context) { AddAssessmentToModuleHistory.call( user: user, assessment: passing_assessment) }
  let(:failing_assessment_context) { AddAssessmentToModuleHistory.call( user: user, assessment: failing_assessment) }

  describe "call" do
    before(:each) do
      allow(assessment_assoc).to receive(:<<)
      allow(user_module_history).to receive(:assessment_attempted)
      allow(user_module_history).to receive(:assessment_attempted=)
      allow(user_module_history).to receive(:assessment_passed=)
      allow(user_module_history).to receive(:assessment_passed)
    end
    context "with passing assessment" do
      it "fetches the users' module history for a given module" do
      
        expect(user).to receive(:find_module_history_by).with(udl_module_id: udl_module_id)
        passing_assessment_context.call
      end

      it "adds the assessment to the user module history" do
        expect(assessment_assoc).to receive(:<<).with(passing_assessment)
        passing_assessment_context.call
      end

      it "marks assessment attempted in module history" do
        expect(user_module_history).to receive(:assessment_attempted=).with(true)
        passing_assessment_context.call
      end
      
      it "sets user_module_history#assessment_passed to true" do
        expect(user_module_history).to receive(:assessment_passed=).with(true)
        passing_assessment_context.call
      end
    end
    context "with failing assessment" do
      it " does NOT set user_module_history#assessment_passed to true" do
        expect(user_module_history).to_not receive(:assessment_passed=).with(true)
        failing_assessment_context.call
      end
    end
  end
end
