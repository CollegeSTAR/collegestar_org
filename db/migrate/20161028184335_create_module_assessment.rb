class CreateModuleAssessment < ActiveRecord::Migration[5.0]
  def change
    create_table :module_assessments do |t|
      t.string :status, default: "unpublished"
      t.references :udl_module, foreign_key: true
    end
  end
end
