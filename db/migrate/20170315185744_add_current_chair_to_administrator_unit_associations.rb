class AddCurrentChairToAdministratorUnitAssociations < ActiveRecord::Migration[5.0]
  def change
    add_column :administrator_unit_associations, :current_chair, :boolean, default: false
  end
end
