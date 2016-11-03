class CreateStarLearningCommunities < ActiveRecord::Migration[5.0]
  def change
    create_table :star_learning_communities do |t|
      t.string :title
      t.string :description
      t.boolean :multi_campus
    end
  end
end
