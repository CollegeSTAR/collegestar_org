require 'spec_helper'

RSpec.describe DssContactPolicy do
  subject { described_class }
  let(:admin) { create(:admin_user) }
  let(:dss_contacts_admin) { create(:dss_contacts_admin_user) }
  let(:user) { create(:user) }
  let(:null_user) { NullUser.new }

  permissions :index?, :show? do
    it "grants admin access" do
      expect(subject).to permit(admin, DssContact.new)
    end

    it "grants dss_contacts_admin access" do
      expect(subject).to permit(dss_contacts_admin, DssContact.new)
    end

    it "grants user access" do
      expect(subject).to permit(user, DssContact.new)
    end

    it "grants null_user access" do
      expect(subject).to permit(null_user, DssContact.new)
    end
  end

  permissions :new?, :edit?, :create?, :update?, :destroy?, :view_admin? do
    it "grants admin access" do
      expect(subject).to permit(admin, DssContact.new)
    end

    it "grants dss_contacts_admin access" do
      expect(subject).to permit(dss_contacts_admin, DssContact.new)
    end

    it "denies user access" do
      expect(subject).to_not permit(user, DssContact.new)
    end

    it "denies null_user access" do
      expect(subject).to_not permit(null_user, DssContact.new)
    end
  end
end
