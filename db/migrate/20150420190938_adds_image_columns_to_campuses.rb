class AddsImageColumnsToCampuses < ActiveRecord::Migration[4.2]
  def self.up
    add_attachment :campuses, :image
  end

  def self.down
    remove_attachment :campuses, :image
  end
end
