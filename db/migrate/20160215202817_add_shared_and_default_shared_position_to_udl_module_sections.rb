class AddSharedAndDefaultSharedPositionToUdlModuleSections < ActiveRecord::Migration
  def change
    add_column :udl_module_sections, :shared, :boolean
    add_column :udl_module_sections, :default_shared_position, :integer
  end
end
