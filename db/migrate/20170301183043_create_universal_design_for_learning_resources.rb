class CreateUniversalDesignForLearningResources < ActiveRecord::Migration[5.0]
  def change
    create_table :universal_design_for_learning_resources do |t|
      t.string :title, null: false
      t.text :description
      t.string :slug, null: false
      t.text :content
      t.boolean :published, default: false
    end
  end
end
