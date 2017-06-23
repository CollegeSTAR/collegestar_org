require 'spec_helper'

RSpec.describe DigestModuleAssessment do
  module_id = "1"
  selected_answer_choices_hash = {"1" => "10", "2" => "11"}
  questions_order = {
    "0" => { 
      "id" => "1", 
      "answer_choices" => { "id" => "10" }
    },
    "1" => {
      "id" => "2",
      "answer_choices" => { "id" => "11" }
    }
  }
  let(:user) { instance_double("User") }
  let(:assessment) { instance_spy("UserModuleAssessment") }
  let(:submitted_params) { instance_double("ActionController::Parameters") }
  let(:context) { DigestModuleAssessment.call( user: user, submitted_params: submitted_params, assessment: assessment) }

  describe "call" do
    before(:each) do
      allow(submitted_params).to receive(:[]).with(:selected_answer_choices).and_return(selected_answer_choices_hash)
      allow(submitted_params).to receive(:[]).with(:module_id).and_return(module_id)
      allow(submitted_params).to receive(:[]).with(:questions_order).and_return(questions_order.to_json)
      allow(assessment).to receive_message_chain(:user_assessment_question_associations, :build)
      allow(assessment).to receive(:save)
    end
    it "should set assessment.user" do
    context
    expect(assessment).to have_received(:user=).with(user)
    end
    it "should set assessment.module_id" do
      context
      expect(assessment).to have_received(:udl_module_id=).with(module_id)
    end
    it "should set assessment_questions_order" do
      context
      expect(assessment).to have_received(:questions_order=).with(questions_order.to_json)
    end
    it "should build a question association from questions_order param" do
      context
      questions_order.keys.each do |key|
        expect(assessment.user_assessment_question_associations).to have_received(:build)
          .with(
            user_module_assessment: assessment, 
            assessment_question_id: questions_order[key]["id"], 
            position: key, 
            answer_choices: questions_order[key]["answer_choices"].to_json,
            selected_answer_id: selected_answer_choices_hash[questions_order[key]["id"]]
          )
      end
    end
    it "should save association" do
      context
      expect(assessment).to have_received(:save)
    end
  end
end
