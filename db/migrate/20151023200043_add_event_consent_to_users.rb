class AddEventConsentToUsers < ActiveRecord::Migration
  def change
    add_column :users, :event_consent, :boolean
    add_index :users, :event_consent
  end
end
