require 'spec_helper'

RSpec.describe UserModuleAssessment do
    
  describe "validations" do
    it { should validate_presence_of(:questions_order) }
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:udl_module) }
  end

  describe "associations" do
    it { should belong_to(:user) }
    it { should belong_to(:udl_module) }
    it { should belong_to(:user_module_history) }
    it { should have_many(:user_assessment_question_associations)
           .order("position")
       }
    it { should have_many(:questions)
           .through(:user_assessment_question_associations)
           .source(:assessment_question).dependent(:destroy)
       }
    it { should have_many(:user_assessment_answer_choice_associations).dependent(:destroy) }
  end

  describe "passed?" do
    context "passed assessment" do
      subject { create(:user_module_assessment, score: '80') }
      it "returns true if score is over 80" do
        expect(subject.passed?).to be_truthy 
      end
    end

    context "failed assessment" do
      subject { create(:user_module_assessment, score: '79') }
      it "returns false if the score is below 80" do
        expect(subject.passed?).to be_falsey
      end
    end
  end
end
