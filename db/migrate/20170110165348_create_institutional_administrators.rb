class CreateInstitutionalAdministrators < ActiveRecord::Migration[5.0]
  def change
    create_table :institutional_administrators do |t|
      t.string :title
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :admin_email
      t.string :admin_assistant
      t.string :admin_assistant_email
      t.string :admin_assistant_location
      t.string :phone
    end
  end
end
