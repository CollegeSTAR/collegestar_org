require 'spec_helper'

RSpec.describe ModuleFacultyAssociation do
  describe "associations" do
    it "belongs to module" do
      is_expected.to belong_to(:module).class_name("UdlModule")
    end
    it "belongs to faculty" do
      is_expected.to belong_to(:faculty).class_name("User")
    end
  end
end
