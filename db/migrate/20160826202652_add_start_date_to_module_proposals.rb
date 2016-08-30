class AddStartDateToModuleProposals < ActiveRecord::Migration[5.0]
  
  def up
    add_column :module_proposals, :start_date, :date, null: true
  end

  def down
    remove_column :module_proposals, :start_date  
  end
end
