class RemoveImageUrlFromCampuses < ActiveRecord::Migration
  def change
    remove_column :campuses, :image_url, :string
  end
end
