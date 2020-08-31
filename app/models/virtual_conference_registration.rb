class VirtualConferenceRegistration < ActiveRecord::Base
  has_secure_token

  validates :first_name,
            :last_name,
            :email,
            :state,
            presence: true
  
  has_many :participant_types, class_name: 'VirtualConferenceParticipantType'

  accepts_nested_attributes_for :participant_types
end
