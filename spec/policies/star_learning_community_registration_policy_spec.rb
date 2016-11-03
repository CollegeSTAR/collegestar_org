require 'spec_helper'

RSpec.describe StarLearningCommunityRegistrationPolicy do
  subject { described_class }
  let(:admin) { create(:admin_user) }
  let(:star_learning_communities_admin) { create(:star_learning_communities_admin_user) }
  let(:user) { create(:user) }
  let(:null_user) { NullUser.new }

  permissions :new?, :create? do
    it "grants admin access" do
      expect(subject).to permit(admin, StarLearningCommunityRegistration.new)
    end
    it "grants star_learning_communities_admin access" do
      expect(subject).to permit(star_learning_communities_admin, StarLearningCommunityRegistration.new)
    end
    it "grants users access" do
      expect(subject).to permit(user, StarLearningCommunityRegistration.new)
    end
    it "grants null_users access" do
      expect(subject).to permit(null_user, StarLearningCommunityRegistration.new)
    end
  end

  permissions :index?, :show?, :view_admin? do
    it "grants admin access" do
      expect(subject).to permit(admin, StarLearningCommunityRegistration.new)
    end
    it "grants star_learning_communities_admin access" do
      expect(subject).to permit(star_learning_communities_admin, StarLearningCommunityRegistration.new)
    end
    it "denies users access" do
      expect(subject).to_not permit(user, StarLearningCommunityRegistration.new)
    end
    it "deines null_user access" do
      expect(subject).to_not permit(null_user, StarLearningCommunityRegistration.new)
    end
  end
end
