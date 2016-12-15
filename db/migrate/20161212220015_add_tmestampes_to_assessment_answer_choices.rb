class AddTmestampesToAssessmentAnswerChoices < ActiveRecord::Migration[5.0]
  def change
    add_column :assessment_answer_choices, :created_at, :datetime
    add_column :assessment_answer_choices, :updated_at, :datetime
  end
end
