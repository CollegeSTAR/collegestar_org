class ChangeSlugDefinitionForCampuses < ActiveRecord::Migration[4.2]
  def change
    change_column :campuses, :slug, :string, { null: false}
  end
end
