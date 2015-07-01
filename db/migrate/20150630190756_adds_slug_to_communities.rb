class AddsSlugToCommunities < ActiveRecord::Migration
  def change
    add_column :communities, :slug, :string
    change_column :communities, :slug, :string, null: false
    add_index :communities, :slug, unique: true
  end
end
