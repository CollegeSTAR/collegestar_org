class AddUserRefToRedesignSummaries < ActiveRecord::Migration[4.2]
  def change
    add_reference :redesign_summaries, :user, index: true, foreign_key: true
  end
end
