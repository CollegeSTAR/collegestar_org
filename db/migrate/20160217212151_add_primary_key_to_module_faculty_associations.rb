class AddPrimaryKeyToModuleFacultyAssociations < ActiveRecord::Migration[4.2]
  def change
    add_column :module_faculty_associations, :id, :primary_key
  end
end
