class AddStartDateNullConstraintToModuleProposals < ActiveRecord::Migration[5.0]
  def up
    change_column :module_proposals, :start_date, :date, null: false
  end

  def down
    change_column :module_proposals, :start_date, :date, null: true
  end
end
