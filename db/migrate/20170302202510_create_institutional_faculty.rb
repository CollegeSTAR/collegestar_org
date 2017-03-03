class CreateInstitutionalFaculty < ActiveRecord::Migration[5.0]
  def change
    create_table :institutional_faculty do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, null: false
      t.references :campus, foreign_key: true
    end
  end
end
