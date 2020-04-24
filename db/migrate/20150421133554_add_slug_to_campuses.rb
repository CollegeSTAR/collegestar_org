class AddSlugToCampuses < ActiveRecord::Migration[4.2]
  def change
    add_column :campuses, :slug, :string
  end
end
