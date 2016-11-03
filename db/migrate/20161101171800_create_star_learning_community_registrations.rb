class CreateStarLearningCommunityRegistrations < ActiveRecord::Migration[5.0]
  def change
    create_table :star_learning_community_registrations do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, null: false
      t.string :phone, null: false
      t.string :department, null: false
      t.string :university, null: false
      t.string :slc, null:false
      t.text :instructional_practice
      t.text :instructional_practice_justification
      t.boolean :udl_representation
      t.boolean :udl_action_expression
      t.boolean :udl_engagement
      t.boolean :network_established

      t.timestamps
    end
  end
end
