class CreateCommunities < ActiveRecord::Migration[4.2]
  def change
    create_table :communities do |t|
      t.string :type
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
