class AddPasswordDigestToUsers < ActiveRecord::Migration[4.2]
  def change
    add_column :users, :password_digest, :string
    change_column :users, :password_digest, :string, { null: false }
  end
end
