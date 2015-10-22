require 'spec_helper'

RSpec.describe ModulesContributingFaculty do
  describe "associations" do
    it "belongs to faculty_module" do
      is_expected.to belong_to(:faculty_module).class_name("UdlModule")
    end
    it "belongs to contributing_faculty" do
      is_expected.to belong_to(:contributing_faculty).class_name("User")
    end
  end
end
