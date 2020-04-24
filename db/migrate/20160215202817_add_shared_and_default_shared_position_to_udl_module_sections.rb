class AddSharedAndDefaultSharedPositionToUdlModuleSections < ActiveRecord::Migration[4.2]
  def change
    add_column :udl_module_sections, :shared, :boolean
    add_column :udl_module_sections, :default_shared_position, :integer
  end
end
