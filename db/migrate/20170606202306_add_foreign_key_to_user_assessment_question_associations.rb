class AddForeignKeyToUserAssessmentQuestionAssociations < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :user_assessment_question_associations, :assessment_answer_choices, column: "selected_answer_id"
  end
end
