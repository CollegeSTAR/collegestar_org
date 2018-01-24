class AddAcceptedAndDeniedToCaseStudyProposals < ActiveRecord::Migration[5.1]
  def change
    add_column :case_study_proposals, :accepted, :boolean, default: false
    add_column :case_study_proposals, :denied, :boolean, default: false
  end
end
