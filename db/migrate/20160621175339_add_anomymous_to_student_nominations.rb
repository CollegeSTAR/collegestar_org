class AddAnomymousToStudentNominations < ActiveRecord::Migration[4.2]
  def change
    add_column :student_nominations, :anonymous, :boolean
  end
end
