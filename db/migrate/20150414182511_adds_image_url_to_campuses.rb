class AddsImageUrlToCampuses < ActiveRecord::Migration[4.2]
  def change
    add_column :campuses, :image_url, :string
  end
end
