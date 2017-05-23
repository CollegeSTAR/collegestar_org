require 'spec_helper'

RSpec.describe UserAssessmentSelectedAnswerChoice do
  describe "associations" do
    it { should belong_to(:user) }
    it { should belong_to(:udl_module) }
    it { should belong_to(:assessment_answer_choice) }
  end
end
