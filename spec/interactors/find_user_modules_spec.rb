require 'spec_helper'

RSpec.describe FindUserModules do
  subject(:context) { FindUserModules.call( user: user, module_klass: udl_module ) }
  let(:user) { double('user') }
  let(:udl_module) { double('UdlModule') }

  describe ".call" do
    context "when user is admin" do
      before do
        allow(user).to receive(:has_role?).and_return(true)
        allow(udl_module).to receive(:released)
        allow(udl_module).to receive(:unreleased)
      end
      it "should return all modules" do
        expect(context.module_klass).to have_received(:released)
        expect(context.module_klass).to have_received(:unreleased)
      end
    end

    context "when user is module author" do
      before do
        allow(user).to receive(:has_role?).and_return(false)
        allow(user).to receive(:has_role?).with(:modules_author).and_return(true)
        allow(user).to receive(:released_modules)
        allow(user).to receive(:unreleased_modules)
      end
      it "should return only user's modules" do
        expect(context.user).to have_received(:released_modules)
        expect(context.user).to have_received(:unreleased_modules)
      end
    end
  end

  context "when user has no permissions" do
    before do
      allow(user).to receive(:has_role?).and_return(false)
    end
    it "should not be successful" do
      expect(context.success?).to be_falsey
      expect(context.error).to eq("User does not have access to UDL Module dashboard")
    end
    it "should return empty arrays for modules" do
      expect(context.released_modules).to eq([])
      expect(context.unreleased_modules).to eq([])
    end
  end
end
