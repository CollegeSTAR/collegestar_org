class CreateModuleSectionAssociations < ActiveRecord::Migration[4.2]
  def change
    create_table :module_section_associations, id: false do |t|
      t.belongs_to :section, index: true, class_name: 'UdlModuleSection'
      t.belongs_to :module, index: true, class_name: 'UdlModule'
    end

    add_foreign_key :module_section_associations, :udl_modules, column: :module_id
    add_foreign_key :module_section_associations, :udl_module_sections, column: :section_id
  end
end
