class AddTimeStampsToUserModuleAssessments < ActiveRecord::Migration[5.1]
  def change
    add_column :user_module_assessments, :created_at, :datetime, null: false
    add_column :user_module_assessments, :updated_at, :datetime, null: false
  end
end
