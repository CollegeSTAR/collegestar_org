class CreateModuleAuthorAssociations < ActiveRecord::Migration
  def change
    create_table :module_author_associations, id: false do |t|
      t.belongs_to :author, index: true, class_name: "User"
      t.belongs_to :module, index: true, class_name: "UdlModule"
    end

    add_foreign_key :module_author_associations, :users, column: :author_id
    add_foreign_key :module_author_associations, :udl_modules, column: :module_id
  end
end
