class CreateModuleFacultyAssociations < ActiveRecord::Migration[4.2]
  def change
    create_table :module_faculty_associations, id: false do |t|
      t.belongs_to :faculty, index: true, class_name: "User"
      t.belongs_to :module, index: true, class_name: "UdlModule"
    end
    
    add_foreign_key :module_faculty_associations, :users, column: :faculty_id 
    add_foreign_key :module_faculty_associations, :udl_modules, column: :module_id
  end
end
