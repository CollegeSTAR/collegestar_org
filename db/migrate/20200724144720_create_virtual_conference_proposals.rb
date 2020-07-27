class CreateVirtualConferenceProposals < ActiveRecord::Migration[5.2]
  def change
    create_table :virtual_conference_proposals do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :presentation_theme, null: false
      t.string :presentation_title, null: false
      t.text :presentation_description, null: false
      t.text :presentation_takeaway, null: false
       
      t.string :token, null: false 
      t.timestamps
    end
  end
end
