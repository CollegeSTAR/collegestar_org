class CreateFacultyNominationSurveys < ActiveRecord::Migration[5.0]
  def change
    create_table :faculty_nomination_surveys do |t|
      t.boolean :remain_anonymous, default: true
      t.boolean :share_name_with_faculty, default: false
      t.boolean :contact_for_more_info, default: false
      t.string :student_name, default: ""
      t.string :student_email, default: ""
      t.string :teaching_strategy, null: false
      t.text :strategy_description, null: false
      t.text :reasons_for_effectiveness, null: false
      t.references :institutional_faculty, foreign_key: true, null: false
      t.string :student_gender, default: ""
      t.string :student_age, default: ""
      t.boolean :student_dss_eligible, default: false
      t.boolean :student_currently_using_dss, default: false
      t.text :quotes

      t.timestamps null: false
    end
  end
end
