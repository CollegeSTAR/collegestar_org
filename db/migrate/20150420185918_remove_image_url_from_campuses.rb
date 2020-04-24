class RemoveImageUrlFromCampuses < ActiveRecord::Migration[4.2]
  def change
    remove_column :campuses, :image_url, :string
  end
end
