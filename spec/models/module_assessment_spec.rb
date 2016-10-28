require 'spec_helper'

RSpec.describe ModuleAssessment do
  
  describe "validations" do
    it { should validate_presence_of(:status) }
  end

  describe "associations" do
    it { should belong_to(:udl_module) }
  end
end
