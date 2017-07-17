class AddIndexToStudentSupportPrograms < ActiveRecord::Migration[5.1]
  def change
    add_index :student_support_programs, :slug, unique: true
  end
end
