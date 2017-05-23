class CreateUserAssessmentSelectedAnswerChoices < ActiveRecord::Migration[5.0]
  def change
    create_table :user_assessment_selected_answer_choices do |t|
      t.references :user_module_assessment, foreign_key: true, index: { name: 'selected_answer_module_assessment_index' }
      t.references :assessment_answer_choice, foreign_key: true, index: { name: 'user_assessment_answer_choice_index' }

    end
  end
end
