require 'spec_helper'

RSpec.describe NullUserModuleHistory do
  
  describe "touch" do
    it "should return true" do
      expect(subject.touch).to eq(true)
    end
  end
end
