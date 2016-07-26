require 'spec_helper'

RSpec.describe UserPolicy do
  subject { described_class }
  let(:admin_user) { create(:admin_user) }
  let(:user) { create(:user) }
  let(:user_two) { create(:user) }
  
  permissions :index? do
    it "denies access without admin role" do
      expect(subject).to_not permit(user, User.new)
    end
    it "grants access with admin role" do
      expect(subject).to permit(admin_user, User.new)
    end
  end

  permissions :show?, :edit?, :update?, :destroy? do
    it "denies access without admin role" do
      expect(subject).to_not permit(user, User.new) 
    end
    it "deines access to a non-admin user trying to view another user's profile" do
      expect(subject).to_not permit(user, user_two)
    end
    it "grants access with admin role" do
      expect(subject).to permit(admin_user, user)
    end
    it "grants access to user's own profile" do
      expect(subject).to permit(user, user)
    end
  end
end
