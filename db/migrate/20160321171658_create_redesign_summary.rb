class CreateRedesignSummary < ActiveRecord::Migration[4.2]
  def change
    create_table :redesign_summaries do |t|
      t.string :uuid, index: true, null: false
      t.string :implemented_technique, null: false
      t.text :summary_content, null: false
      t.boolean :representation, default: false
      t.boolean :action_expression, default: false
      t.boolean :engagement, default: false

      t.timestamps
    end
  end
end
