require 'spec_helper'

RSpec.describe MediaConsent do
  
  describe "validations" do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should have_attached_file(:image) }
    it { should validate_attachment_presence(:image) }
    it { should validate_attachment_content_type(:image).
      allowing(["image/jpeg", "image/png"])
    }
  end
end
