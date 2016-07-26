require 'spec_helper'

RSpec.describe ModuleProposalPolicy do
  subject { described_class }
  let(:admin) { create(:admin_user) }
  let(:module_proposals_admin) { create(:module_proposals_admin_user) }
  let(:user) { create(:user) }
  let(:null_user) { NullUser.new }

  permissions :new?, :create? do
    it "grants admin access" do
      expect(subject).to permit(admin, ModuleProposal.new)
    end
    it "grants module_proposals_admin access" do
      expect(subject).to permit(module_proposals_admin, ModuleProposal.new)
    end
    it "grants users access" do
      expect(subject).to permit(user, ModuleProposal.new)
    end
    it "grants null_users access" do
      expect(subject).to permit(null_user, ModuleProposal.new)
    end
  end

  permissions :index?, :show?, :edit?, :update?, :destroy?, :view_admin? do
    it "grants admin access" do
      expect(subject).to permit(admin, ModuleProposal.new)
    end
    it "grants module_proposals_admin access" do
      expect(subject).to permit(module_proposals_admin, ModuleProposal.new)
    end
    it "denies users access" do
      expect(subject).to_not permit(user, ModuleProposal.new)
    end
    it "deines null_user access" do
      expect(subject).to_not permit(null_user, ModuleProposal.new)
    end
  end
end
