require 'spec_helper'

RSpec.describe VirtualConferenceProposal do
  
  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:presentation_theme) }
    it { should validate_presence_of(:presentation_title) }
    it { should validate_presence_of(:presentation_description) }
    it { should validate_presence_of(:presentation_takeaway) }
  end
end
