class AddModuleTypeToUdlModules < ActiveRecord::Migration[5.1]
  def change
    add_column :udl_modules, :module_type, :string
  end
end
