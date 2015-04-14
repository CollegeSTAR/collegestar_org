class CreateCampuses < ActiveRecord::Migration
  def change
    change_table :campuses do |t|
      t.string :name
      t.string :image
      t.string :website
      t.string :address_1
      t.string :address_2
      t.index :director_id
      
      t.timestamps null: false
    end
    add_foreign_key :campuses, :users
  end
end
