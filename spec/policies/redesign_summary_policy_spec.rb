require 'spec_helper'

RSpec.describe RedesignSummaryPolicy do
  subject { described_class }
  let(:admin) { create(:admin_user) }
  let(:redesign_summaries_admin) { create(:redesign_summaries_admin_user) }
  let(:user) { create(:user) }
  let(:redesign_summary) { create(:redesign_summary) }
  let(:null_user) { NullUser.new }

  permissions :index?, :new?, :create? do
    it "grants admins access" do
      expect(subject).to permit(admin, RedesignSummary.new)
    end
    it "grants redesign_summaries_admins access" do
      expect(subject).to permit(redesign_summaries_admin, RedesignSummary.new)
    end
    it "grants users access" do
      expect(subject).to permit(user, RedesignSummary.new)
    end
    it "denies null_users access" do
      expect(subject).to_not permit(null_user, RedesignSummary.new)
    end
  end

  permissions :show?, :edit?, :update?, :destroy? do
    it "grants admins access" do
      expect(subject).to permit(admin, RedesignSummary.new)
    end
    it "grants redesign_summaries_admins access" do
      expect(subject).to permit(redesign_summaries_admin, RedesignSummary.new)
    end
    it "denies users access to summaries they do not own" do
      expect(subject).to_not permit(user, RedesignSummary.new)
    end
    it "grants users access to summaries they own" do
      redesign_summary.user = user
      redesign_summary.save
      expect(subject).to permit(user, redesign_summary)
    end
    it "denies access to null_users" do
      expect(subject).to_not permit(null_user, RedesignSummary.new)
    end
  end

  permissions :view_admin? do
    it "grants admins access" do
      expect(subject).to permit(admin, RedesignSummary.new)
    end
    it "grants redesign_summaries_admins access" do
      expect(subject).to permit(redesign_summaries_admin, RedesignSummary.new)
    end
    it "denies users access" do
      expect(subject).to_not permit(user, RedesignSummary.new)
    end
    it "denies null_users access" do
      expect(subject).to_not permit(user, RedesignSummary.new)
    end
  end
end
