require "rails_helper"

RSpec.describe ContactMailer do
  let(:contact) { build(:contact) }
  let(:mail) { described_class.contact_us( contact ).deliver_now }
  context "without send_copy" do
    it "should send an email" do
      expect{
        mail
      }.to change{ ActionMailer::Base.deliveries.count }.by(1)
    end

    it  "should only send to ContactMailer::DEFAULT_ADDRESS when contact.send_copy is 0" do
       expect(mail.to).to match_array([ContactMailer::DEFAULT_ADDRESS])
    end

    it "should have the correct subject" do
      expect(mail.subject).to eq(contact.subject)
    end  
  end


  it "should send a copy to the contact.email when contact.send_copy is 1" do
    contact.send_copy = 1
    mail = described_class.contact_us( contact ).deliver_now
    expect(mail.to).to match_array([ContactMailer::DEFAULT_ADDRESS, contact.email])
  end
end
