class CreateModuleSectionAssociations < ActiveRecord::Migration
  def change
    create_table :module_section_associations, id: false do |t|
      t.belongs_to :section, index: true, class_name: 'UdlModuleSection'
      t.belongs_to :module, index: true
    end

    add_foreign_key :module_section_associations, :module
    add_foreign_key :module_section_associations, :section
  end
end
