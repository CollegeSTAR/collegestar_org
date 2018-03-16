class AddModuleHistoryAssociationToUserModuleAssessment < ActiveRecord::Migration[5.1]
  def change
    add_reference :user_module_assessments, :user_module_history, foreign_key: true
  end
end
