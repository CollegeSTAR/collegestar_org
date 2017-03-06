class CreateInstitutionalCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :institutional_courses do |t|
      t.string :course_number, null: false
      t.string :course_name, null: false
      t.references :campus, foreign_key: true
    end
  end
end
