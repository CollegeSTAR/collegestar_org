class CreateStudentSupportSummitQuestionnaires < ActiveRecord::Migration[5.1]
  def change
    create_table :student_support_summit_questionnaires do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.text :most_excited_about
      t.text :issues
      t.text :challenges
      t.text :well_spent_time

      t.timestamps
    end
  end
end
