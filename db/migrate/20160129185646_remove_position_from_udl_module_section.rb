class RemovePositionFromUdlModuleSection < ActiveRecord::Migration
  def change
    change_table :udl_module_sections do |t|
      t.remove :position
    end
  end
end
