class AddEventConsentToUsers < ActiveRecord::Migration[4.2]
  def change
    add_column :users, :event_consent, :boolean
    add_index :users, :event_consent
  end
end
