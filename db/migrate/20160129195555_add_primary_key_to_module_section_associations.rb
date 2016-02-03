class AddPrimaryKeyToModuleSectionAssociations < ActiveRecord::Migration
  def change
    add_column :module_section_associations, :id, :primary_key
  end
end
