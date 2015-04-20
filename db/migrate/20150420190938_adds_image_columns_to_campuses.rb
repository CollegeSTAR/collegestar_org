class AddsImageColumnsToCampuses < ActiveRecord::Migration
  def self.up
    add_attachment :campuses, :image
  end

  def self.down
    remove_attachment :campuses, :image
  end
end
