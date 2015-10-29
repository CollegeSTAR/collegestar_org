class AddSlugToUdlModuleSections < ActiveRecord::Migration
  def change
    add_column :udl_module_sections, :slug, :string
  end
end
