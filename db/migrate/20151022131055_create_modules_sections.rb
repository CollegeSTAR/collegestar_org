class CreateModulesSections < ActiveRecord::Migration
  def change
    create_table :modules_sections, id: false do |t|
      t.belongs_to :section, index: true, class_name: 'UdlModuleSection'
      t.belongs_to :section_module, index: true
    end

    add_foreign_key :modules_sections, :section_module
    add_foreign_key :modules_sections, :section
  end
end
