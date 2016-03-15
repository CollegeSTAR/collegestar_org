class AddDirectorToCampuses < ActiveRecord::Migration
  def change
    add_column :campuses, :director_id, :integer
    add_index :campuses, :director_id
  end
end
