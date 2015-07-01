class RemoveTypeFromCommunities < ActiveRecord::Migration
  def change
    remove_column :communities, :type, :string 
  end
end
