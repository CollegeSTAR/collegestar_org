class AddAnomymousToStudentNominations < ActiveRecord::Migration
  def change
    add_column :student_nominations, :anonymous, :boolean
  end
end
