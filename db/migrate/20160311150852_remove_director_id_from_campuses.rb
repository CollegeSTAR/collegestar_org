class RemoveDirectorIdFromCampuses < ActiveRecord::Migration
  def change
    remove_column :campuses, :director_id, :integer
  end
end
