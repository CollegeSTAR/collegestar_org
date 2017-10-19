require 'spec_helper'

RSpec.describe MediaConsentPolicy do
  subject { described_class }
  let(:admin) { create(:admin_user) }
  let(:student_support_program_admin) { create(:student_support_program_admin_user) }
  let(:user) { create(:user) }
  let(:null_user) { NullUser.new }

  permissions :index?, :show?, :view_admin? do
    it "grants admin access" do
      expect(subject).to permit(admin, MediaConsent.new)
    end
    it "grants student_support_program_admin" do
      expect(subject).to permit(student_support_program_admin, MediaConsent.new)
    end
    it "denies access to user" do
      expect(subject).to_not permit(user, MediaConsent.new)
    end
    it "denies null user access" do
      expect(subject).to_not permit(null_user, MediaConsent.new)
    end
  end

  permissions :new?, :create? do
    it "grants admin access" do
      expect(subject).to permit(admin, MediaConsent.new)
    end
    it "grants student_support_program_admin" do
      expect(subject).to permit(student_support_program_admin, MediaConsent.new)
    end
    it "grants access to user" do
      expect(subject).to permit(user, MediaConsent.new)
    end
    it "grants null user access" do
      expect(subject).to permit(null_user, MediaConsent.new)
    end
  end

  permissions :update?, :delete? do
    it "denies admin access" do
      expect(subject).to_not permit(admin, MediaConsent.new)
    end
    it "denies student_support_program_admin" do
      expect(subject).to_not permit(student_support_program_admin, MediaConsent.new)
    end
    it "denies access to user" do
      expect(subject).to_not permit(user, MediaConsent.new)
    end
    it "denies null user access" do
      expect(subject).to_not permit(null_user, MediaConsent.new)
    end
  end
end
