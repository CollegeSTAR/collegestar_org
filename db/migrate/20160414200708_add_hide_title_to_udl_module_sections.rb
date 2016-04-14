class AddHideTitleToUdlModuleSections < ActiveRecord::Migration
  def change
    add_column :udl_module_sections, :hide_title, :boolean, default: false
  end
end
