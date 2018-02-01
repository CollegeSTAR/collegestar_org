require 'spec_helper'

RSpec.describe ParseUserModuleAssessmentResult do
  let(:assessment) { create(:user_module_assessment) }
  let(:context) { ParseUserModuleAssessmentResult.call( assessment: assessment ) }

  describe "call" do
    it "sets context.score to assessment score" do
      expect(context.score).to eq(assessment.score)
    end
    
    it "sets context.questions to assessment questions" do
      expect(context.questions.first.question_text).to eq(assessment.questions.first.question)
    end
  end
end
