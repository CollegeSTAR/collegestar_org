class CreateAssessmentQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :assessment_questions do |t|
      t.string :question
      t.string :explanation
      t.references :udl_module_section, foreign_key: true
      t.boolean :ordered
    end
  end
end
