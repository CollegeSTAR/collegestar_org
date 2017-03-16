class AddSlugToInstitutionalUnits < ActiveRecord::Migration[5.0]
  def change
    add_column :institutional_units, :slug, :string, null: false
  end
end
