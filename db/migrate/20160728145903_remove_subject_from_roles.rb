class RemoveSubjectFromRoles < ActiveRecord::Migration[5.0]
  def change
    remove_column :roles, :subject, :string
  end
end
