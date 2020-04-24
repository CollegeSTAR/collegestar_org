class RemovePositionFromUdlModuleSection < ActiveRecord::Migration[4.2]
  def change
    change_table :udl_module_sections do |t|
      t.remove :position
    end
  end
end
