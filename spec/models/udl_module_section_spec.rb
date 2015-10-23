require 'spec_helper'

RSpec.describe UdlModuleSection do
  describe "associations" do
    it "has many modules" do
      is_expected.to have_many(:modules).through(:module_section_associations)
    end
    it "has many module_section_associations" do
      is_expected.to have_many(:module_section_associations)
    end
  end
end
