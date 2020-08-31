class CreateVirtualConferenceRegistrations < ActiveRecord::Migration[5.2]
  def change
    create_table :virtual_conference_registrations do |t|
      t.string :token, null: false
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, null: false
      t.string :state, null: false
      t.boolean :parent, default: false
      t.boolean :student, default: false
      t.boolean :education_professional, default: false
      t.string :theme_rank_1
      t.string :theme_rank_2
      t.string :theme_rank_3
      t.string :theme_rank_4
      t.integer :number_of_participants, null: false
      t.boolean :mailing_list

      t.timestamps
    end
  end
end
