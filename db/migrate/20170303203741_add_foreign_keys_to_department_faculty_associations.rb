class AddForeignKeysToDepartmentFacultyAssociations < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key :department_faculty_associations, :institutional_units, column: :department_id
    add_foreign_key :department_faculty_associations, :institutional_faculty, column: :faculty_id
  end
end
