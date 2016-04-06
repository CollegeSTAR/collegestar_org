class ChangeImplementedTechniqueOnRedesignSummaries < ActiveRecord::Migration
  def change
    change_column :redesign_summaries, :implemented_technique, :string, null: true
  end
end
