class AddModuleConsentToUsers < ActiveRecord::Migration[4.2]
  def change
    add_column :users, :module_consent, :boolean
    add_index :users, :module_consent
  end
end
