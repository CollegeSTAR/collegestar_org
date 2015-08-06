require 'rails_helper'

RSpec.describe Contact do
  describe "validations" do
    it "should not be valid without a name" do
      @contact = build(:contact, name: nil)
      expect(@contact.valid?).to be_falsey
    end
    it "should not be valid without an email address" do
      @contact = build(:contact, email: nil)
      expect(@contact.valid?).to be_falsey
    end
    it "should not be valid with invalid email address" do
      @contact = build(:contact, email: "tannerjones")
      expect(@contact.valid?).to be_falsey
    end
    it "should not be valid without a message" do
      @contact = build(:contact, message: nil)
      expect(@contact.valid?).to be_falsey
    end
  end
end
