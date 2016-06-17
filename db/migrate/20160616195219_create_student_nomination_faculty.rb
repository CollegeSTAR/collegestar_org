class CreateStudentNominationFaculty < ActiveRecord::Migration
  def change
    create_table :student_nomination_faculty do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.references :campus_department, index: true, foreign_key: true
      t.references :campus_unit, index: true, foreign_key: true
      t.string :timestamps
    end
  end
end
