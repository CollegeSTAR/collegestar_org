class AddReviewReadyToRedesignSummary < ActiveRecord::Migration[4.2]
  def change
    add_column :redesign_summaries, :review_ready, :boolean, default: false
  end
end
