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

  describe "#apply_abilities" do
    before(:each) do
      @ability = double("ability")
    end
    it "should call can on ability class with correct arguments" do
      @role = create(:admin_role)
      expect(@ability).to receive(:can).with(:manage, :all)
      @role.apply_abilities @ability
    end

    it "should format subject appropriately" do
      @role = create(:event_admin_role)
      expect(@ability).to receive(:can).with(:manage, Event)
      @role.apply_abilities @ability
    end
  end
end
