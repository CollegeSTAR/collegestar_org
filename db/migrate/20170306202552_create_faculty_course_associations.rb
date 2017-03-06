class CreateFacultyCourseAssociations < ActiveRecord::Migration[5.0]
  def change
    create_table :faculty_course_associations do |t|
      t.references :institutional_faculty, foreign_key: true
      t.references :institutional_course, foreign_key: true
    end
  end
end
