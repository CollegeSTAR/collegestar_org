class StudentSupportSummitRegistration < ActiveRecord::Base
  validates :program_name, 
            :contact_name,
            :contact_email, 
            :contact_phone,
            :institution, 
            :first_attendee_first_name,
            :first_attendee_last_name,
            :first_attendee_email,
            :first_attendee_phone,
            :first_attendee_address,
            :first_attendee_city,
            :first_attendee_state,
            :first_attendee_zip, presence: true
  validates :program_name, uniqueness: true
end
