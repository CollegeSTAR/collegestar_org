class AddCorrectAnswerChoiceToAssessmentQuestions < ActiveRecord::Migration[5.0]
  def change
    add_reference :assessment_questions, :correct_answer_choice, references: :assessment_answer_choices, index: true
    add_foreign_key :assessment_questions, :assessment_answer_choices, column: :correct_answer_choice_id
  end
end
