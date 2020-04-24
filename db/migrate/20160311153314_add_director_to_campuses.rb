class AddDirectorToCampuses < ActiveRecord::Migration[4.2]
  def change
    add_column :campuses, :director_id, :integer
    add_index :campuses, :director_id
  end
end
