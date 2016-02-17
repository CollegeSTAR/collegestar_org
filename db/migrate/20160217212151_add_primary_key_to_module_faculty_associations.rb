class AddPrimaryKeyToModuleFacultyAssociations < ActiveRecord::Migration
  def change
    add_column :module_faculty_associations, :id, :primary_key
  end
end
