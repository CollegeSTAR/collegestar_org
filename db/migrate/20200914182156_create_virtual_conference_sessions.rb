class CreateVirtualConferenceSessions < ActiveRecord::Migration[5.2]
  def change
    create_table :virtual_conference_sessions do |t|
      t.string :title, null: false
      t.string :slug, null: false
      t.string :conference_track
      t.text :description
      t.text :short_description
      t.string :meeting_url
      t.datetime :start_time, null: false
      t.datetime :end_time

      t.timestamps
    end
  end
end
