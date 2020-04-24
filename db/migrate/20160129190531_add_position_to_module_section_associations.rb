class AddPositionToModuleSectionAssociations < ActiveRecord::Migration[4.2]
  def change
    add_column :module_section_associations, :section_page_position, :integer
  end
end
