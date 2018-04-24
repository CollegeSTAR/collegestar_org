class AddEmailIndexToSendgridEvents < ActiveRecord::Migration[5.1]
  def change
    add_index :sendgrid_events, :email
  end
end
