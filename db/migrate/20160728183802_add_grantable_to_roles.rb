class AddGrantableToRoles < ActiveRecord::Migration[5.0]
  def change
    add_column :roles, :grantable, :boolean, default: true
  end
end
