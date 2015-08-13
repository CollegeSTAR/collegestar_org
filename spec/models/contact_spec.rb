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
    it "should not be valide without a subject" do
      @contact = build(:contact, subject: nil)
      expect(@contact.valid?).to be_falsey
    end
    it "should not be valid without a message" do
      @contact = build(:contact, message: nil)
      expect(@contact.valid?).to be_falsey
    end
    it "should not add contact.email to recipient list if send_copy is 0" do
      @recipients_list = []
      @contact = build(:contact)
      @recipients_list = @contact.add_recipient(@recipients_list)
      expect(@recipients_list).to match_array([])
    end
    it "should add contact.email to recipient list if send_copy is 1" do
      @recipients_list = []
      @contact = build(:contact, send_copy: 1)
      @recipients_list = @contact.add_recipient(@recipients_list)
      expect(@recipients_list).to match_array([@contact.email])
    end
  end
end
