require 'spec_helper'

RSpec.describe StudentSupportProgramPolicy do
  subject { described_class }
  let(:admin) { create(:admin_user) }
  let(:student_support_program_admin) { create(:student_support_program_admin_user) }
  let(:user) { create(:user) }
  let(:null_user) { NullUser.new}

  permissions :index?, :show? do
    it "grants admin access" do
      expect(subject).to permit(admin, StudentSupportProgram.new)
    end
    it "grants student_support_program_admin access" do
      expect(subject).to permit(student_support_program_admin, StudentSupportProgram.new)
    end
    it "grants user access" do
      expect(subject).to permit(user, StudentSupportProgram.new)
    end
    it "grants null_user access" do
      expect(subject).to permit(null_user, StudentSupportProgram.new)
    end
  end

  permissions :new?, :create?, :edit?, :update?, :delete?, :view_admin? do
    it "grants admin access" do
      expect(subject).to permit(admin, StudentSupportProgram.new)
    end
    it "grants student_support_program_admin access" do
      expect(subject).to permit(student_support_program_admin, StudentSupportProgram.new)
    end

    it "denies user access" do
      expect(subject).to_not permit(user, StudentSupportProgram.new)
    end
    
    it "denies null_user access" do
      expect(subject).to_not permit(null_user, StudentSupportProgram.new)
    end
  end
end
