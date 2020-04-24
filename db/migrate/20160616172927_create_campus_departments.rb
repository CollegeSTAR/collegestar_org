class CreateCampusDepartments < ActiveRecord::Migration[4.2]
  def change
    create_table :campus_departments do |t|
      t.string :name
      t.references :campus, index: true, foreign_key: true
      t.string :chair_first_name
      t.string :chair_last_name
      t.string :chair_email
      t.string :timestamps
    end
  end
end
