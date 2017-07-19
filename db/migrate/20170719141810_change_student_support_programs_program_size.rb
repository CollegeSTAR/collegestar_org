class ChangeStudentSupportProgramsProgramSize < ActiveRecord::Migration[5.1]
  def change
    change_column :student_support_programs, :program_size, :string
  end
end
