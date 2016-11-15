class CreateFrequentlyAskedQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :frequently_asked_questions do |t|
      t.string :question
      t.text :answer
      t.string :slug
      t.integer :position

      t.timestamps
    end
  end
end
