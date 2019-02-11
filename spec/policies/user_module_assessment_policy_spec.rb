require 'spec_helper'

RSpec.describe UserModuleAssessmentPolicy do
  subject { described_class }
  let(:admin) { create(:admin_user) }
  let(:user) { create(:user) }
  let(:null_user) { NullUser.new }
  let(:udl_module) { create(:udl_module) }
  
  permissions :show? do
    context "All assessments, including not owned by current user" do
      it "grants admin access" do
        expect(subject).to permit(admin, UserModuleAssessment.new)
      end
      it "denies access to user" do
        expect(subject).to_not permit(user, UserModuleAssessment.new)
      end
      it "denies access to null_user" do
        expect(subject).to_not permit(null_user, UserModuleAssessment.new)
      end
    end
    context "Assessments owned by user" do
      it "grants access to user whom owns the assessment" do
        assessment = UserModuleAssessment.create(user: user, udl_module: udl_module)
        expect(subject).to permit(user, assessment)
      end
    end
  end
end
