class CreateModuleFacultyAssociations < ActiveRecord::Migration
  def change
    create_table :module_faculty_associations, id: false do |t|
      t.belongs_to :faculty, index: true, class_name: "User"
      t.belongs_to :module, index: true
    end
    
    add_foreign_key :module_faculty_associations, :faculty
    add_foreign_key :module_faculty_associations, :module
  end
end
