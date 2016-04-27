require 'spec_helper'

RSpec.describe UdlModuleSectionHelper do
  let(:admin) { create(:admin_user) }
  let(:user) { create(:user) }
  describe "#module_admin?" do
    context "with admin user" do
      it "should return true" do
        expect( helper.module_admin?(admin) ).to be true
      end
    end
    context "with normal user" do
      it "should return false" do
        expect( helper.module_admin?(user) ).to be false
      end
    end
  end
end
