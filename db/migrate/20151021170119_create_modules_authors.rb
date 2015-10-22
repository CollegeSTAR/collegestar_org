class CreateModulesAuthors < ActiveRecord::Migration
  def change
    create_table :modules_authors, id: false do |t|
      t.belongs_to :author, index: true, class_name: "User"
      t.belongs_to :author_module, index: true
    end

    add_foreign_key :modules_authors, :author
    add_foreign_key :modules_authors, :author_module
  end
end
