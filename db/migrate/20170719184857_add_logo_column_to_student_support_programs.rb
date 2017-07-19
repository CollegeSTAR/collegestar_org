class AddLogoColumnToStudentSupportPrograms < ActiveRecord::Migration[5.1]
  def change
    add_attachment :student_support_programs, :logo
  end
end
