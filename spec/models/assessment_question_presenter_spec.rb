require 'spec_helper'

RSpec.describe AssessmentQuestionPresenter do
  
  let(:association) { double( "UserModuleAssessmentAssociation", 
                               correct: false, 
                               answer_choices: JSON.generate({
                                 "0": {id: "1"},
                                 "1": {id: "2"}
                               }),
                               selected_answer_id: 1
                            ) 
                    }
  let(:question) { double( "AssessmentQuestion", 
                            question: "The Question",
                            explanation: "This is the explanation",
                            correct_answer_choice_id: "2"
                         ) }
  let(:attributes) { {
      association: association,
      question: question,
    }
  }
  let(:presenter) { AssessmentQuestionPresenter.new(attributes) }

  it "should return correct boolean" do
    expect(presenter.correct?).to eq(association.correct)
  end

  it "should return question text" do
    expect(presenter.question_text).to eq(question.question)
  end

  it "should return question's explanation" do
    expect(presenter.explanation).to eq(question.explanation)
  end

  it "should return association's selected_answer_id" do
    expect(presenter.selected_answer_choice_id).to eq(association.selected_answer_id)
  end

  it "should return question's correct_answer_choice_id" do
    expect(presenter.correct_answer_choice_id).to eq(question.correct_answer_choice_id)
  end
end
