class CreateModuleAuthorAssociations < ActiveRecord::Migration
  def change
    create_table :module_author_associations, id: false do |t|
      t.belongs_to :author, index: true, class_name: "User"
      t.belongs_to :module, index: true
    end

    add_foreign_key :module_author_associations, :author
    add_foreign_key :module_author_associations, :module
  end
end
