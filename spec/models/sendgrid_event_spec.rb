require 'rails_helper'

RSpec.describe SendgridEvent do
  
  describe "validations" do
    it { should validate_uniqueness_of(:sg_event_id).allow_nil }
    it { should validate_presence_of(:event) }
    it { should validate_presence_of(:email) }
  end
end
