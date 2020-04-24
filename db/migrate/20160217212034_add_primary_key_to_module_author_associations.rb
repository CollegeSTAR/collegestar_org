class AddPrimaryKeyToModuleAuthorAssociations < ActiveRecord::Migration[4.2]
  def change
    add_column :module_author_associations, :id, :primary_key
  end
end
