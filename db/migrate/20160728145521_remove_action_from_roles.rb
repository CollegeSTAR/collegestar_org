class RemoveActionFromRoles < ActiveRecord::Migration[5.0]
  def change
    remove_column :roles, :action, :string
  end
end
