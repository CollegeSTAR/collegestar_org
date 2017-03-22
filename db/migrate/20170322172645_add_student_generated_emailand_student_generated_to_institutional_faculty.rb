class AddStudentGeneratedEmailandStudentGeneratedToInstitutionalFaculty < ActiveRecord::Migration[5.0]
  def change
    add_column :institutional_faculty, :student_generated_email, :string
    add_column :institutional_faculty, :student_generated, :boolean
  end
end
