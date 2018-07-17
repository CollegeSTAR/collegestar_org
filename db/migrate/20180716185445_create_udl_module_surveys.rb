class CreateUdlModuleSurveys < ActiveRecord::Migration[5.2]
  def change
    create_table :udl_module_surveys do |t|
      t.references :udl_module_feedback, foreign_key: true
      t.references :user, foreign_key: true
      t.references :udl_module, foreign_key: true
      t.string :length_of_time, default: ""
      t.string :organization_of_module, default: ""
      t.string :quality_of_content, default: ""
      t.string :relevance_to_my_needs, defaut: ""
      t.string :plan_to_implement, default: ""
      t.string :likely_to_recommend, default: ""
      t.string :access_another_module, default: ""
      t.text :additional_feedback, default: ""
      t.boolean :join_mailing_list, default: false

      t.timestamps
    end
  end
end
