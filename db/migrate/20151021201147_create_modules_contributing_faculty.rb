class CreateModulesContributingFaculty < ActiveRecord::Migration
  def change
    create_table :modules_contributing_faculty, id: false do |t|
      t.belongs_to :contributing_faculty, index: true, class_name: "User"
      t.belongs_to :faculty_module, index: true
    end
    
    add_foreign_key :modules_contributing_faculty, :contributing_faculty
    add_foreign_key :modules_contributing_faculty, :faculty_module
  end
end
