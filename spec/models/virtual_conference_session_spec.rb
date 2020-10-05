require 'rails_helper'

RSpec.describe VirtualConferenceSession do

  describe "Validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:slug) }
    it { should validate_presence_of(:start_time) }
  end

  describe "to_param" do
    
  end
end
