class AddHistorytoCampuses < ActiveRecord::Migration[5.1]
  def change
    add_column :campuses, :history, :text
  end
end
