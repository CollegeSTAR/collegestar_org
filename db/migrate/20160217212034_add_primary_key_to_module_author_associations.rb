class AddPrimaryKeyToModuleAuthorAssociations < ActiveRecord::Migration
  def change
    add_column :module_author_associations, :id, :primary_key
  end
end
