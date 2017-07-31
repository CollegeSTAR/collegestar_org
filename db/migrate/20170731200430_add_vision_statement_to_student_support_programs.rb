class AddVisionStatementToStudentSupportPrograms < ActiveRecord::Migration[5.1]
  def change
    add_column :student_support_programs, :vision_statement, :string
  end
end
