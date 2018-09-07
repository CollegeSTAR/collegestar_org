class CreateThreeTwoOneVideoProposals < ActiveRecord::Migration[5.2]
  def change
    create_table :three_two_one_video_proposals do |t|
      t.string :token, null: false
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, null: false
      t.string :institution
      t.string :title
      t.boolean :representation
      t.boolean :action_expression
      t.boolean :engagement
      t.text :instructional_practice

      t.timestamps
    end
  end
end
