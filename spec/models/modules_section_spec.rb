require 'spec_helper'

RSpec.describe ModulesSection do
  describe "associations" do
    it "belongs to section_module" do
      is_expected.to belong_to(:section_module).class_name("UdlModule")
    end
    it "belongs to section" do
      is_expected.to belong_to(:section).class_name("UdlModuleSection")
    end
  end
end
