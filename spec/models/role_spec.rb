require 'rails_helper'

RSpec.describe Role do 

  describe "validations" do
    it "should require a name" do
      @role = build(:basic_role, name: nil)
      expect(@role.valid?).to be_falsey
    end
  end
end
