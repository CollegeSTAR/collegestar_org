class CreateUdlModuleFeedback < ActiveRecord::Migration[5.2]
  def change
    create_table :udl_module_feedbacks do |t|
      t.boolean :resource_was_helpful
      t.references :udl_module, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
