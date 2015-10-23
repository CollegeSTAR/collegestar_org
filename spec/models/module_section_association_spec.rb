require 'spec_helper'

RSpec.describe ModuleSectionAssociation do
  describe "associations" do
    it "belongs to module" do
      is_expected.to belong_to(:module).class_name("UdlModule")
    end
    it "belongs to section" do
      is_expected.to belong_to(:section).class_name("UdlModuleSection")
    end
  end
end
