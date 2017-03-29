class AddStudentGeneratedFacultyMemberToFacultyNominationSurveys < ActiveRecord::Migration[5.0]
  def change
    add_column :faculty_nomination_surveys, :faculty_first_name, :string
    add_column :faculty_nomination_surveys, :faculty_last_name, :string
    add_reference :faculty_nomination_surveys, :department, foreign_key: { to_table: :institutional_units }
  end
end
