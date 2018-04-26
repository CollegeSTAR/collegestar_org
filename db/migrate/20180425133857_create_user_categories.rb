class CreateUserCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :user_categories do |t|
      t.string :name, null: false
      t.boolean :selectable, default: false
    end
  end
end
