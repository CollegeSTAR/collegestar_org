class ChangeSlugDefinitionForCampuses < ActiveRecord::Migration
  def change
    change_column :campuses, :slug, :string, { null: false}
  end
end
