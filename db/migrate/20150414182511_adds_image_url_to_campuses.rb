class AddsImageUrlToCampuses < ActiveRecord::Migration
  def change
    add_column :campuses, :image_url, :string
  end
end
