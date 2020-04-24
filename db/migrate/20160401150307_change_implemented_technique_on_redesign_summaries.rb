class ChangeImplementedTechniqueOnRedesignSummaries < ActiveRecord::Migration[4.2]
  def change
    change_column :redesign_summaries, :implemented_technique, :string, null: true
  end
end
