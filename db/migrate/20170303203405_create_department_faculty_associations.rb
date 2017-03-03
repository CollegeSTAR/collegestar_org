class CreateDepartmentFacultyAssociations < ActiveRecord::Migration[5.0]
  def change
    create_table :department_faculty_associations do |t|
      t.references :department
      t.references :faculty
    end
  end
end
