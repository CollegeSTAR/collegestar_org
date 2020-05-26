class CreateThinkUdlSnippets < ActiveRecord::Migration[5.2]
  def change
    create_table :think_udl_snippets do |t|
      t.string :slug, null: false
      t.string :video_url, null: false
      t.string :title, null: false
      t.text :description
      t.string :episode_url, null: false
      t.string :episode_title, null: false
      t.text :episode_description

      t.timestamps
    end
  end
end
