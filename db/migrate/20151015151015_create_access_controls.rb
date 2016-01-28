class CreateAccessControls < ActiveRecord::Migration
  def change
    create_table :access_controls, id: false do |t|
      t.belongs_to :role, index: true
      t.belongs_to :user, index: true
    end
    add_foreign_key :access_controls, :roles
    add_foreign_key :access_controls, :users
  end
end
