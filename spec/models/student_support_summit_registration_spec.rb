require 'spec_helper'

RSpec.describe StudentSupportSummitRegistration do
  
  describe "Validations" do
    it { should validate_presence_of(:program_name) }
    it { should validate_uniqueness_of(:program_name) }
    it { should validate_presence_of(:contact_name) }
    it { should validate_presence_of(:contact_email) }
    it { should validate_presence_of(:contact_phone) }
    it { should validate_presence_of(:institution) }
    it { should validate_presence_of(:first_attendee_first_name) }
    it { should validate_presence_of(:first_attendee_last_name) }
    it { should validate_presence_of(:first_attendee_email) }
    it { should validate_presence_of(:first_attendee_phone) }
    it { should validate_presence_of(:first_attendee_address) }
    it { should validate_presence_of(:first_attendee_city) }
    it { should validate_presence_of(:first_attendee_state) }
    it { should validate_presence_of(:first_attendee_zip) }
  end
end
