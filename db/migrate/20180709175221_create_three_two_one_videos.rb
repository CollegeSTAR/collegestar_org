class CreateThreeTwoOneVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :three_two_one_videos do |t|
      t.string :title, null: false
      t.string :slug, null: false
      t.string :youtube_id, null: false
      t.text :caption
      t.text :notes
      t.boolean :released, default: false

      t.timestamps
    end
  end
end
