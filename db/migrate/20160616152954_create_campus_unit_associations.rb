class CreateCampusUnitAssociations < ActiveRecord::Migration
  def change
    create_table :campus_unit_associations do |t|
      t.references :campus, index: true, foreign_key: true
      t.references :campus_unit, index: true, foreign_key: true
      t.string :timestamps
    end
  end
end
