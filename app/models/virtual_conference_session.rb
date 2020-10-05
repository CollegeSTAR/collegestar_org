class VirtualConferenceSession < ActiveRecord::Base
  
  validates :title,
            :slug,
            :start_time,
            presence: true

  def to_param
    slug
  end
end
