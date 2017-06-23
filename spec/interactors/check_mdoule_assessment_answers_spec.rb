require 'spec_helper'

RSpec.describe CheckModuleAssessmentAnswers do
  let(:user) { instance_double("User") }  
  let(:assessment_question_klass) { class_double("AssessmentQuestion") }
  let(:correctly_answered_question) { instance_double("AssessmentQuestion", id: 1, correct_answer_choice_id: 10) }
  let(:correctly_answered_question_association) { instance_double("UserAssessmentQuestionAssociation", assessment_question_id: 1) }
  let(:incorrectly_answered_question) { instance_double("AssessmentQuestion", id: 2, correct_answer_choice_id: 12) }
  let(:incorrectly_answered_question_association) { instance_double("UserAssessmentQuestionAssociation", assessment_question_id: 2) }
  let(:assessment_answer_choice_klass) { class_double("AssessmentAnswerChoice") }
  let(:submitted_params) { instance_double("ActionController::Parameters") }
  let(:assessment) { instance_double("UserModuleAssessment", score: 0) }
  let(:context) { CheckModuleAssessmentAnswers.call( 
                                                     user: user, 
                                                     assessment_question_klass: assessment_question_klass,
                                                     submitted_params: submitted_params,
                                                     assessment: assessment
                                                   ) 
                }

  describe "call" do
    before(:each) do
      allow(assessment).to receive(:score=)
      allow(assessment).to receive(:save)
      allow(correctly_answered_question).to receive_message_chain("user_assessment_question_associations.find_by")
                                          .with(user_module_assessment: assessment)
                                          .and_return(correctly_answered_question_association)
      allow(incorrectly_answered_question).to receive_message_chain("user_assessment_question_associations.find_by")
                                          .with(user_module_assessment: assessment)
                                          .and_return(incorrectly_answered_question_association)
      allow(assessment_question_klass).to receive(:where).and_return([correctly_answered_question, incorrectly_answered_question])
      # This is a string of json that represents questions with ids of
      # 1, 2.
      allow(submitted_params).to receive(:[]).with(:questions_order).and_return(
        "{\"0\":{\"id\":1},\"1\":{\"id\":2}}"
      )
      # These are the questions with there submitted answer choices in the following
      # format: { "question_id": "answer_choice_id" }
      # Question id: 1 has been answered correctly, 10, while question id: 2 has been 
      # answered incorrectly, 11 given/12 is correct.
      allow(submitted_params).to receive(:[]).with(:selected_answer_choices).and_return(
        {"1": "10", "2": "11"}
      )
      allow(correctly_answered_question_association).to receive(:correct=)
      allow(correctly_answered_question_association).to receive(:save)
      allow(incorrectly_answered_question_association).to receive(:correct=)
      allow(incorrectly_answered_question_association).to receive(:save)
    end

    it "loads all used questions" do
      expect(assessment_question_klass).to receive(:where).with(id: [1,2])
      context
    end
    it "marks correct questions correct" do
      expect(correctly_answered_question_association).to receive(:correct=).with(true)
      expect(correctly_answered_question_association).to receive(:save)
      context
    end
    it "marks incorrect questions incorrect" do
      expect(incorrectly_answered_question_association).to receive(:correct=).with(false)
      expect(incorrectly_answered_question_association).to receive(:save)
      context
    end
    # We update the score with 100/question count if the question is correctly answered
    # We have two questions in the test suite and only one is correct
    # therefore, the score would be 50
    it "updates assessment.score" do
      expect(assessment).to receive(:score=).with( 50 ).once
      context
    end
    it "saves assessment" do
      expect(assessment).to receive(:save).once
      context
    end
  end
end
