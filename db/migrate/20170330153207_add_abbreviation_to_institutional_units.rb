class AddAbbreviationToInstitutionalUnits < ActiveRecord::Migration[5.0]
  def change
    add_column :institutional_units, :abbreviation, :string
  end
end
