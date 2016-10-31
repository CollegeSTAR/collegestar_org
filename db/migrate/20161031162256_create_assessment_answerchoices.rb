class CreateAssessmentAnswerchoices < ActiveRecord::Migration[5.0]
  def change
    create_table :assessment_answer_choices do |t|
      t.string :text
      t.string :explanation
      t.integer :position
    end
  end
end
