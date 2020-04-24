class AddsSlugToCommunities < ActiveRecord::Migration[5.2]
  def change
    add_column :communities, :slug, :string
    change_column :communities, :slug, :string, null: false
    add_index :communities, :slug, unique: true
  end
end
