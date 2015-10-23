class AddModuleConsentToUsers < ActiveRecord::Migration
  def change
    add_column :users, :module_consent, :boolean
    add_index :users, :module_consent
  end
end
