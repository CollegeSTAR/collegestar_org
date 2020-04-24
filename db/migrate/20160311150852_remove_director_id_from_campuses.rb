class RemoveDirectorIdFromCampuses < ActiveRecord::Migration[4.2]
  def change
    remove_column :campuses, :director_id, :integer
  end
end
