class AddCorrectToUserAssessmentQuestionAssociations < ActiveRecord::Migration[5.1]
  def change
    add_column :user_assessment_question_associations, :correct, :boolean
  end
end
