class CreateUserModuleAssessment < ActiveRecord::Migration[5.0]
  def change
    create_table :user_module_assessments do |t|
      t.references :user, foreign_key: true
      t.references :udl_module, foreign_key: true
      t.boolean :completed
      t.json :questions_order
      t.string :score
    end
  end
end
