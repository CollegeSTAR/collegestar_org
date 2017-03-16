class AddTimestampsToInstitutionalUnits < ActiveRecord::Migration[5.0]
  def change
    add_column :institutional_units, :created_at, :datetime
    add_column :institutional_units, :updated_at, :datetime
  end
end
