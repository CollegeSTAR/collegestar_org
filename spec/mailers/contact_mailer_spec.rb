require "rails_helper"

RSpec.describe ContactMailer do
  context "without send_copy" do
    before(:each) do
      @contact = build(:contact)
      @email = ContactMailer.contact_us(@contact).deliver_now
    end
    it "should send an email" do
          expect(ActionMailer::Base.deliveries.count).to eq(1)
    end

    it  "should only send to ContactMailer::DEFAULT_ADDRESS when contact.send_copy is 0" do
       expect(ActionMailer::Base.deliveries.first.to).to match_array([ContactMailer::DEFAULT_ADDRESS])
    end

    it "should have the correct subject" do
      expect(ActionMailer::Base.deliveries.first.subject).to eq(@contact.subject)
    end  
  end


  it "should send a copy to the contact.email when contact.send_copy is 1" do
    @contact = build(:contact, send_copy: 1)
    @email = ContactMailer.contact_us(@contact).deliver_now
    expect(ActionMailer::Base.deliveries.first.to).to match_array([ContactMailer::DEFAULT_ADDRESS, @contact.email])
  end
end
