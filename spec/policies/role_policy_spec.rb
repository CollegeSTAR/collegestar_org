require 'spec_helper'

RSpec.describe RolePolicy do
  subject { described_class }
  let(:admin) { create(:admin_user) }
  let(:users_admin) { create(:users_admin_user) }
  let(:user) { create(:user) }
  let(:null_user) { NullUser.new }

  permissions :grant? do
    it "grants admin access" do
      expect(subject).to permit(admin, Role.new)
    end
    it "grants user_admin access" do
      expect(subject).to permit(users_admin, Role.new)
    end
    it "denies user access" do
      expect(subject).to_not permit(user, Role.new)
    end
    it "denies null_user access" do
      expect(subject).to_not permit(null_user, Role.new)
    end
  end
end
