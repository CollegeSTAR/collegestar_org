class VirtualConferenceProposal < ActiveRecord::Base
  has_secure_token

  validates :name,
            :email,
            :presentation_theme,
            :presentation_title,
            :presentation_description,
            :presentation_takeaway,
            presence: true
end
