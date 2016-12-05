class AddStatusToModuleProposals < ActiveRecord::Migration[5.0]
  def change
    add_column :module_proposals, :status, :string, default: "open"
  end
end
