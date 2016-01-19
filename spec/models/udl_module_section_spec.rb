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

  describe "set_position" do
    let(:udl_module) { create(:udl_module_with_sections) }
    it "should set position of new sections" do
      udl_module
      section = create(:introduction_section)
      expect(section.position).to eq(2)
    end
  end
end
