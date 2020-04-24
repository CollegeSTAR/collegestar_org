class AddNameIndexToEvents < ActiveRecord::Migration[4.2]
  def change
    add_index :events, :name, { unique: true}
  end
end
