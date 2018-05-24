require 'spec_helper'

RSpec.describe NewsLetterSubscription do
  
  describe "validations" do
    subject { create(:news_letter_subscription) }
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
  end
end
