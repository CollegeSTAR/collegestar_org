class RemoveTypeFromCommunities < ActiveRecord::Migration[4.2]
  def change
    remove_column :communities, :type, :string 
  end
end
