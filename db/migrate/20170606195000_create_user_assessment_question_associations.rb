class CreateUserAssessmentQuestionAssociations < ActiveRecord::Migration[5.1]
  def change
    create_table :user_assessment_question_associations do |t|
      t.references :user_module_assessment, foreign_key: true, index: { name: :user_assessment_question_association_assessment_index }
      t.references :assessment_question, foreign_key: true, index: { name: :user_assessment_question_association_question_index }
      t.integer :position
      t.jsonb :answer_choices
      t.integer :selected_answer_id

      t.timestamps
    end
  end
end
