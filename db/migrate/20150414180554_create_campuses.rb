class CreateCampuses < ActiveRecord::Migration
  def change
    create_table :campuses do |t|
      t.string :name, null: false
      t.string :abbreviation, null: false
      t.string :type, null: false
      t.integer :director_id
      t.string :website_url
      t.string :address_1, null: false
      t.string :address_2
      t.string :city, null: false
      t.string :state, null: false
      t.string :zip, null: false

      t.timestamps null: false
    end

    add_foreign_key :campuses, :users, on_delete: :cascade, column: :director_id
  end
end
