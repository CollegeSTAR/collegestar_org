require 'spec_helper'

RSpec.describe StudentSupportSummitQuestionnairePolicy do
  subject { described_class }
  
  let(:admin) { create(:admin_user) }
  let(:student_support_program_admin) { create(:student_support_program_admin_user) }
  let(:user) { create(:user) }
  let(:null_user) { NullUser.new}

  permissions :index?, :show?, :view_admin? do
    it "grants admin access" do
      expect(subject).to permit(admin, StudentSupportSummitQuestionnaire.new)
    end
    it "grants student_support_program_admin access" do
      expect(subject).to permit(student_support_program_admin, StudentSupportSummitQuestionnaire.new)
    end
    it "denies user access" do
      expect(subject).to_not permit(user, StudentSupportSummitQuestionnaire.new)
    end    
    it "denies null_user access" do
      expect(subject).to_not permit(null_user, StudentSupportSummitQuestionnaire.new)
    end
  end

  permissions :new?, :create? do
    it "grants admin access" do
      expect(subject).to permit(admin, StudentSupportSummitQuestionnaire.new)
    end
    it "grants student_support_program_admin access" do
      expect(subject).to permit(student_support_program_admin, StudentSupportSummitQuestionnaire.new)
    end
    it "grants user access" do
      expect(subject).to permit(user, StudentSupportSummitQuestionnaire.new)
    end    
    it "grants null_user access" do
      expect(subject).to permit(null_user, StudentSupportSummitQuestionnaire.new)
    end
  end

  permissions :update?, :destroy? do
    it "denies admin access" do
      expect(subject).to_not permit(admin, StudentSupportSummitQuestionnaire.new)
    end
    it "denies student_support_program_admin access" do
      expect(subject).to_not permit(student_support_program_admin, StudentSupportSummitQuestionnaire.new)
    end
    it "denies user access" do
      expect(subject).to_not permit(user, StudentSupportSummitQuestionnaire.new)
    end    
    it "denies null_user access" do
      expect(subject).to_not permit(null_user, StudentSupportSummitQuestionnaire.new)
    end
  end
end
