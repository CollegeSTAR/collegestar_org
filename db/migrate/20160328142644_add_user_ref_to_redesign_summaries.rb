class AddUserRefToRedesignSummaries < ActiveRecord::Migration
  def change
    add_reference :redesign_summaries, :user, index: true, foreign_key: true
  end
end
