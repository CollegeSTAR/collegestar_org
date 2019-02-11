require 'spec_helper'

RSpec.describe ModuleAssessmentPolicy do
  
  subject { described_class }
  let(:admin) { create(:admin_user) }
  let(:modules_admin) { create(:modules_admin_user) }
  let(:modules_author) { create(:modules_author_user) }
  let(:user) { create(:user) }
  let(:null_user) { NullUser.new }

  permissions :show?, :create? do
    it "grants access to admin" do
      expect(subject).to permit(admin, ModuleAssessment.new)
    end
    it "grants access to modules_admin" do
      expect(subject).to permit(modules_admin, ModuleAssessment.new)
    end
    it "grants access to modules_author" do
      expect(subject).to permit(modules_author, ModuleAssessment.new)
    end
    it "grants access to user" do
      expect(subject).to permit(user, ModuleAssessment.new)
    end
    it "denies access to null user" do
      expect(subject).to_not permit(null_user, ModuleAssessment.new)
    end
  end
end
