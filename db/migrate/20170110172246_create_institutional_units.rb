class CreateInstitutionalUnits < ActiveRecord::Migration[5.0]
  def change
    create_table :institutional_units do |t|
      t.string :type
      t.string :name
      t.string :mail_stop
      t.references :institutional_unit, index: true, foreign_key: true
    end
  end
end
