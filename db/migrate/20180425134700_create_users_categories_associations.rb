class CreateUsersCategoriesAssociations < ActiveRecord::Migration[5.1]
  def change
    create_table :user_category_associations do |t|
      t.references :user, foreign_key: true
      t.references :user_category, foreign_key: true

      t.timestamps
    end
  end
end
