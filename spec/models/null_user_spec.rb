require 'spec_helper'

RSpec.describe NullUser do
  let(:null_user) { NullUser.new }
  describe "#id" do
    it "should return nil" do
      expect(null_user.id).to eq(nil)
    end
  end

  describe "#authenticate" do
    it "should return false" do
      expect(null_user.authenticate "" ).to be_falsey    
    end
  end

  describe "#has_role?" do
    it "should return false" do
      expect(null_user.has_role? :admin ).to be_falsey
    end
  end
end
