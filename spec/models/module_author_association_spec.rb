require 'spec_helper'

RSpec.describe ModuleAuthorAssociation do
  describe "associations" do
    it "should belong to module" do
      is_expected.to belong_to(:module).class_name("UdlModule")
    end
    it "should belong to author" do
      is_expected.to belong_to(:author).class_name("User")
    end
  end
end
