class AddSlugToUdlModuleSections < ActiveRecord::Migration[4.2]
  def change
    add_column :udl_module_sections, :slug, :string
  end
end
