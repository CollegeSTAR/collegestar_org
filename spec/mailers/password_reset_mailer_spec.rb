require 'rails_helper'

RSpec.describe PasswordResetMailer do
  let(:user) { create(:user) }
  describe "#reset_instructions" do
    before(:each) do
      user.generate_token :password_reset_token
      user.save
      PasswordResetMailer.reset_instructions(user).deliver_now
    end
    it "should send email" do
      expect(ActionMailer::Base.deliveries.count).to eq(1)
    end
    it  "should send to user email" do
       expect(ActionMailer::Base.deliveries.first.to).to match_array(user.email)
    end

    it "should have the correct subject" do
      expect(ActionMailer::Base.deliveries.first.subject).to eq("College STAR password reset instructions")
    end  
  end
end
