class CreateCampusUnit < ActiveRecord::Migration[4.2]
  def change
    create_table :campus_units do |t|
      t.string :name
      t.references :campus, index: true, foreign_key: true
      t.string :director_first_name
      t.string :director_last_name
      t.string :director_email

      t.timestamps
    end
  end
end
