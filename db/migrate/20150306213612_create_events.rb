class CreateEvents < ActiveRecord::Migration[4.2]
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :registration_open_datetime
      t.datetime :registration_close_datetime
      t.integer :max_registrants
      t.datetime :start_datetime
      t.datetime :end_datetime
      t.string :address
      t.string :address_2
      t.string :city
      t.string :state
      t.string :zip_code

      t.timestamps null: false
    end
  end
end
