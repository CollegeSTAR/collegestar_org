class AddSlugToEvents < ActiveRecord::Migration[4.2]
  def change
    add_column :events, :slug, :string
    change_column :events, :slug, :string, {null: false}
    add_index :events, :slug, { unique: true}
  end
end
