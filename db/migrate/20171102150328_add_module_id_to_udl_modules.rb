class AddModuleIdToUdlModules < ActiveRecord::Migration[5.1]
  def change
    add_reference :udl_modules, :module, foreign_key: { to_table: :udl_modules}
  end
end
