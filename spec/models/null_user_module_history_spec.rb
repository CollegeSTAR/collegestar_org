require 'spec_helper'

RSpec.describe NullUserModuleHistory do
  
  describe "touch" do
    it "should return true" do
      expect(subject.touch).to eq(true)
    end
  end

  describe "find_or_create_by" do
    it "should return instance of NullUserModuleHistory" do
      expect(subject.find_or_create_by(udl_module_id: 1)).to be_instance_of(NullUserModuleHistory)
    end
  end
end
