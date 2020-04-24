class AddPrimaryKeyToModuleSectionAssociations < ActiveRecord::Migration[4.2]
  def change
    add_column :module_section_associations, :id, :primary_key
  end
end
