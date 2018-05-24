class CreateNewsLetterSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :news_letter_subscriptions do |t|
      t.string :first_name
      t.string :last_name
      t.string :title
      t.string :company
      t.string :email, null: false
      t.boolean :case_studies, default: false
      t.boolean :learning_communities, default: false
      t.boolean :research, default: false
      t.boolean :udl_in_higher_ed, default: false
    end
  end
end
