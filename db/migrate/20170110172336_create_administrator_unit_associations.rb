class CreateAdministratorUnitAssociations < ActiveRecord::Migration[5.0]
  def change
    create_table :administrator_unit_associations do |t|
      t.references :institutional_administrator, foreign_key: true, index: { name: 'index_admin_unit_associations_on_administrator_id' }
      t.references :institutional_unit, foreign_key: true, index: { name: 'index_admin_unit_associations_on_unit_id' }
    end
  end
end
