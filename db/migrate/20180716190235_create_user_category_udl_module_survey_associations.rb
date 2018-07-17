class CreateUserCategoryUdlModuleSurveyAssociations < ActiveRecord::Migration[5.2]
  def change
    create_table :user_category_udl_module_survey_associations do |t|
      t.references :user_category, foreign_key: true, index: { name: "index_user_cat_mod_survey_on_user_cat_id" }
      t.references :udl_module_survey, foreign_key: true, index: { name: "index_user_cat_mod_survey_on_mod_survey_id" }
    end
  end
end
