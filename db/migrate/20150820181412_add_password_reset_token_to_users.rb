class AddPasswordResetTokenToUsers < ActiveRecord::Migration[4.2]
  def change
    add_column :users, :password_reset_token, :string
  end
end
