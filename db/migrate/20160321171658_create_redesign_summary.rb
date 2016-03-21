class CreateRedesignSummary < ActiveRecord::Migration
  def change
    create_table :redesign_summaries do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :title, null: false
      t.string :department, null: false
      t.string :campus, null: false
      t.string :implemented_technique, null: false
      t.text :redesign_process, null: false
      t.text :assessment_description, null: false
      t.text :examples, null: false
      t.text :challenges, null: false
      t.boolean :representation, default: false
      t.boolean :action_expression, default: false
      t.boolean :engagement, default: false

      t.timestamps
    end
  end
end
