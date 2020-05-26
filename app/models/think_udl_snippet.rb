class ThinkUdlSnippet < ActiveRecord::Base
  validates :video_url,
            :title,
            :description,
            :episode_url,
            :episode_title,
            :episode_description,
            presence: true
end
