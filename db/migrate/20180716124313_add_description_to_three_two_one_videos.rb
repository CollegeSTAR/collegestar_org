class AddDescriptionToThreeTwoOneVideos < ActiveRecord::Migration[5.2]
  def change
    add_column :three_two_one_videos, :description, :text, default: ""
  end
end
