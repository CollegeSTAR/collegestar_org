class AddCampusToInstitutionalUnits < ActiveRecord::Migration[5.0]
  def change
    add_reference :institutional_units, :campus, foreign_key: true
  end
end
