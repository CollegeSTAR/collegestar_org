class CreateUdlModules < ActiveRecord::Migration
  def change
    create_table :udl_modules do |t|
      t.string :title
      t.string :slug
      t.string :sub_heading
      t.string :udl_principles
      t.text :description
      t.boolean :released
      t.date :release_date
      t.date :latest_revision_date

      t.timestamps null: false
    end
  end
end
