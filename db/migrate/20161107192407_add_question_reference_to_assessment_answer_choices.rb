class AddQuestionReferenceToAssessmentAnswerChoices < ActiveRecord::Migration[5.0]
  def change
    add_reference :assessment_answer_choices, :assessment_question, foreign_key: true
  end
end
