class CreateStudentNominations < ActiveRecord::Migration
  def change
    create_table :student_nominations do |t|
      t.string :student_name
      t.string :student_email
      t.string :student_gender
      t.string :student_age
      t.boolean :share_student_name
      t.boolean :student_gift_card
      t.boolean :contact_student
      t.boolean :student_disability_current
      t.boolean :student_disability_eligible
      t.text :strategy_name
      t.text :strategy_description
      t.text :strategy_effectiveness
      t.text :quotes
      t.references :student_nomination_faculty

      t.timestamps
    end
  end
end
