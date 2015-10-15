class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name
      t.string :action
      t.string :subject
      t.string :conditions
      t.timestamps null: false
    end
  end
end
