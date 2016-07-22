require 'rails_helper'

RSpec.describe Role do 

  describe "validations" do
    it "should require a name" do
      @role = build(:basic_role, name: nil)
      expect(@role.valid?).to be_falsey
    end
    it "should require an action" do
      @role = build(:basic_role, action: nil)
      expect(@role.valid?).to be_falsey
    end
    it "should require a subject" do
      @role = build(:basic_role, subject: nil)
      expect(@role.valid?).to be_falsey
    end
    it "should not require a condition" do
      @role = build(:basic_role, conditions: nil)
      expect(@role.valid?).to be_truthy
    end
  end
end
