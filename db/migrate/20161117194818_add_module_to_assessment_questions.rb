class AddModuleToAssessmentQuestions < ActiveRecord::Migration[5.0]
  def change
    add_reference :assessment_questions, :udl_module, foreign_key: true
  end
end
