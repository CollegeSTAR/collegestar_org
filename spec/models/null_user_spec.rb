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

  describe "#generate_password_reset" do
    it "should return false" do
      expect(null_user.generate_password_reset).to be_falsey
    end
  end

  describe "module_histories" do
    it "should return NullUserModuleHistory" do
      expect(null_user.module_histories).to match_array([])
    end
  end

  describe "find_module_history" do
    it "should return NullUserModuleHistory" do
      expect(null_user.find_module_history(module_id: 1)).to be_an_instance_of(NullUserModuleHistory)
    end
  end
end
