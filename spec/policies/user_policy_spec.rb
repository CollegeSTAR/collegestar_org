require 'spec_helper'

RSpec.describe UserPolicy do
  subject { described_class }
  let(:admin) { create(:admin_user) }
  let(:users_admin) { create(:users_admin_user) }
  let(:user) { create(:user) }
  let(:user_two) { create(:user) }
  let(:null_user) { NullUser.new }

  permissions :index? do
    it "denies access without admin role" do
      expect(subject).to_not permit(user, User.new)
    end
    it "grants access with admin role" do
      expect(subject).to permit(admin, User.new)
    end
    it "grants access with user_admin role" do
      expect(subject).to permit(users_admin, User.new)
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
      expect(subject).to permit(admin, user)
    end
    it "grants access with user_admin role" do
      expect(subject).to permit(users_admin, User.new)
    end
    it "grants access to user's own profile" do
      expect(subject).to permit(user, user)
    end
  end

  permissions :change_password? do
    it "denies admin access" do
      expect(subject).to_not permit(admin, User.new)
    end
    it "denies users_admin access" do
      expect(subject).to_not permit(users_admin, User.new)
    end
    it "denies user access" do
      expect(subject).to_not permit(user, User.new)
    end
    it "denies null_user access" do
      expect(subject).to_not permit(null_user, User.new)
    end
    it "grants access to user's own account" do
      expect(subject).to permit(user, user)
    end
  end
end
