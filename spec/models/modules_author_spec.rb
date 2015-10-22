require 'spec_helper'

RSpec.describe ModulesAuthor do
  describe "associations" do
    it "should belong to author_module" do
      is_expected.to belong_to(:author_module).class_name("UdlModule")
    end
    it "should belong to author" do
      is_expected.to belong_to(:author).class_name("User")
    end
  end
end
