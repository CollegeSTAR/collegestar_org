class AddActivationTokenToUsers < ActiveRecord::Migration[4.2]
  def change
    add_column :users, :activation_token, :string
  end
end
