class CreateDssContact < ActiveRecord::Migration[5.0]
  def change
    create_table :dss_contacts do |t|
      t.string :slug, null: false
      t.string :institution_type, null: false
      t.string :campus_name, null: false
      t.string :dss_office, null: false
      t.text :description_of_services
      t.string :contact_person
      t.string :contact_email
      t.string :contact_phone_number
      t.string :dss_website

      t.timestamps
    end
  end
end
