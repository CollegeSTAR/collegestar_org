require 'rails_helper'

RSpec.describe Contact do
  let(:unread_contact) { create(:contact, status: 'unread') }
  let(:read_contact) { create(:contact, status: 'read') }
  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:subject) }
    it { should validate_presence_of(:message) }
  end

  describe "scopes" do
    context "unread" do
      it "should only return unread contacts" do
        unread_contact
        read_contact
        expect(Contact.unread).to eq([unread_contact])
      end
    end
  end
end
