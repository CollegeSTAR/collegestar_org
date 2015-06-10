class AddNameIndexToEvents < ActiveRecord::Migration
  def change
    add_index :events, :name, { unique: true}
  end
end
