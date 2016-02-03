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

  describe "#position" do
    let(:udl_module) { create(:udl_module) }
    let(:udl_module_section) { create(:udl_module_section) }
    context "given a module_id and parent page" do
      it "should return the correct position" do
        udl_module.add_section( udl_module_section )
        expect(
          udl_module_section.position( module: udl_module )
        ).to eq(1)
      end
    end
  end
end
