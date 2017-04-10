class RenameModuleProposalsToCaseStudyProposals < ActiveRecord::Migration[5.0]
  def change
    rename_table :module_proposals, :case_study_proposals
  end
end
