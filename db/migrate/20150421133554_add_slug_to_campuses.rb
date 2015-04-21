class AddSlugToCampuses < ActiveRecord::Migration
  def change
    add_column :campuses, :slug, :string
  end
end
