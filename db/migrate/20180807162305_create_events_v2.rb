class CreateEventsV2 < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name, null: false
      t.string :slug, null: false
      t.string :address
      t.string :dates
      t.string :website
      t.text :description

      t.timestamps
    end
  end
end
