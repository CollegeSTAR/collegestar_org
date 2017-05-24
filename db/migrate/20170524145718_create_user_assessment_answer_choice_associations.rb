class CreateUserAssessmentAnswerChoiceAssociations < ActiveRecord::Migration[5.0]
  def change
    create_table :user_assessment_answer_choice_associations do |t|
      t.references :user_module_assessment, foreign_key: true, index: { name: :user_assessment_association_assessment_index }
      t.references :assessment_answer_choice, foreign_key: true, index: { name: :user_assessment_association_answer_choice_index }
    end
  end
end
