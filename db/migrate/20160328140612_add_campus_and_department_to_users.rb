class AddCampusAndDepartmentToUsers < ActiveRecord::Migration[4.2]
  def change
    add_column :users, :department, :string
    add_reference :users, :campus, index: true
    add_foreign_key :users, :campuses
  end
end
