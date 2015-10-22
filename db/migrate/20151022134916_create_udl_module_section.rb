class CreateUdlModuleSection < ActiveRecord::Migration
  def change
    create_table :udl_module_sections do |t|
      t.string :title
      t.text :content
      t.string :parent
      t.integer :position
    end
  end
end
