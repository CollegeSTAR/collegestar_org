class AddReviewReadyToRedesignSummary < ActiveRecord::Migration
  def change
    add_column :redesign_summaries, :review_ready, :boolean, default: false
  end
end
