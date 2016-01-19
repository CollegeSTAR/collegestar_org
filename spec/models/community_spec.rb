require 'rails_helper'

RSpec.describe Community do
  describe "validations" do
    it "should validate that a name is present" do
      @community = build(:community, name: nil)
      expect(@community.valid?).to be_falsey
    end
    it "should validate that a slug is present" do
      @community = build(:community, slug: nil)
      expect(@community.valid?).to be_falsey
    end
  end
end
