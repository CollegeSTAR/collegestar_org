require 'spec_helper'

RSpec.describe UdlModuleSection do
  describe "associations" do
    it "has many section_modules" do
      is_expected.to have_many(:section_modules).through(:modules_sections)
    end
    it "has many modules_sections" do
      is_expected.to have_many(:modules_sections)
    end
  end
end
