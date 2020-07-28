require 'spec_helper'

RSpec.describe VirtualConferenceProposalPolicy do
  subject { described_class }

  let(:admin) { create(:admin_user) }
  let(:conference_admin) { create(:conference_admin_user) }
  let(:user) { create(:user) }
  let(:null_user) { NullUser.new }  

  permissions :new?, :create? do
    it "grants admin access" do
      expect(subject).to permit(admin, VirtualConferenceProposal.new)
    end

    it "grants conference_admin access" do
      expect(subject).to permit(conference_admin, VirtualConferenceProposal.new)
    end

    it "grants user access" do
      expect(subject).to permit(user, VirtualConferenceProposal.new)
    end

    it "grants null_user access" do
      expect(subject).to permit(null_user, VirtualConferenceProposal.new)
    end
  end

  permissions :index?, :show? do
    it "grants admin access" do
      expect(subject).to permit(admin, VirtualConferenceProposal.new)
    end

    it "grants conference_admin access" do
      expect(subject).to permit(conference_admin, VirtualConferenceProposal.new)
    end

    it "denies user access" do
      expect(subject).to_not permit(user, VirtualConferenceProposal.new)
    end

    it "denies null_user access" do
      expect(subject).to_not permit(null_user, VirtualConferenceProposal.new)
    end
  end
end
