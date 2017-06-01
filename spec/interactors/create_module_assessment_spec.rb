require 'spec_helper'

RSpec.describe CreateModuleAssessment do
  let(:user) { instance_double("User") }
  let(:selected_answer_choices) { {"60": "254", "70": "260"} }
  let(:submitted_params) { 
    {
      module_id: 1, 
      questions_order: {
        "0": {id: 1, answer_choices: {}}
      },
      selected_answer_choices: selected_answer_choices
    }
  }
  let(:assessment) { instance_double("UserModuleAssessment") }
  let(:context) {
    CreateModuleAssessment.call(user: user, submitted_params: submitted_params, assessment: assessment)
  }
  
  before(:each) do
    allow(assessment).to receive(:user=)
    allow(assessment).to receive(:udl_module_id=)
    allow(assessment).to receive(:questions_order=)
    allow(assessment).to receive(:answer_ids=)
    allow(assessment).to receive(:save)
  end

  context "with correct attributes" do
    it "succeeds" do
      expect(context).to be_a_success
    end

    it "assigns a user" do
      expect(assessment).to receive(:user=).with(user)
      context
    end

    it "assigns a module" do
      expect(assessment).to receive(:udl_module_id=).with(submitted_params[:module_id])
      context
    end

    it "assigns questions_order" do
      expect(assessment).to receive(:questions_order=).with(submitted_params[:questions_order])
      context
    end

    it "assigns answer_ids" do
      expect(assessment).to receive(:answer_ids=).with(selected_answer_choices.values)
      context
    end

    it "saves assessment" do
      expect(assessment).to receive(:save)
      context
    end
  end
end
