class AddStrategyLinkToCaseStudyProposals < ActiveRecord::Migration[5.1]
  def change
    add_column :case_study_proposals, :strategy_link, :text
  end
end
