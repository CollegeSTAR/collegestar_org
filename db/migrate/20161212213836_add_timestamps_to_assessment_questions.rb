class AddTimestampsToAssessmentQuestions < ActiveRecord::Migration[5.0]
  def change
    add_column :assessment_questions, :created_at, :datetime
    add_column :assessment_questions, :updated_at, :datetime
  end
end
