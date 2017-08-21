require 'spec_helper'

RSpec.describe StudentSupportSummitRegistrationPolicy do
  subject { described_class }
  let(:admin) { create(:admin_user) }
  let(:registrations_admin) { create(:student_support_summit_registrations_admin_user) }
  let(:user) { create(:user) }
  let(:null_user) { NullUser.new }

  permissions :new?, :create? do
    it "grants admin access" do
      expect(subject).to permit(admin, StudentSupportSummitRegistration)
    end
    it "grants registrations_admin access" do
      expect(subject).to permit(registrations_admin, StudentSupportSummitRegistration)
    end
    it "grants user access" do
      expect(subject).to permit(user, StudentSupportSummitRegistration)
    end
    it "grants null user access" do
      expect(subject).to permit(null_user, StudentSupportSummitRegistration)
    end
  end

  permissions :index?, :show? do
    it "grants admin access" do
      expect(subject).to permit(admin, StudentSupportSummitRegistration)
    end
    it "grants registrations_admin access" do
      expect(subject).to permit(registrations_admin, StudentSupportSummitRegistration)
    end
    it "grants user access" do
      expect(subject).to_not permit(user, StudentSupportSummitRegistration)
    end
    it "grants null user access" do
      expect(subject).to_not permit(null_user, StudentSupportSummitRegistration)
    end  end
end
