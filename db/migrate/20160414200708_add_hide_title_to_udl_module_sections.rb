class AddHideTitleToUdlModuleSections < ActiveRecord::Migration[4.2]
  def change
    add_column :udl_module_sections, :hide_title, :boolean, default: false
  end
end
