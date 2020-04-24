class CreateModuleProposals < ActiveRecord::Migration[4.2]
  def change
    create_table :module_proposals do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :university, null: false
      t.string :department, null: false
      t.string :email, null: false
      t.string :module_type, null: false
      t.string :title, null: false
      t.text :description, null: false
      t.date :completion_date, null: false
      t.string :payment_method, null: false

      t.timestamps null: false
    end
  end
end
