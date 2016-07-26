require 'spec_helper'

RSpec.describe CampusPolicy do
  subject { described_class }
  let(:admin) { create(:admin_user) }
  let(:campus_admin) { create(:campus_admin_user) }
  let(:user) { create(:user) }
  let(:null_user) { NullUser.new }
  
  permissions :show?, :index? do
    it "grants access to user with no roles" do
      expect(subject).to permit(user, Campus.new)
    end
    it "grants access to null user." do
      expect(subject).to permit(null_user, Campus.new)
    end
  end

  permissions :new?, :create?, :edit?, :update?, :destroy? do
    it "grants access to admin" do
      expect(subject).to permit(admin, Campus.new)
    end
    it "grants access to campus_admin" do
      expect(subject).to permit(campus_admin, Campus.new)
    end
    it "denies access to user" do
      expect(subject).to_not permit(user, Campus.new)
    end
    it "deines access to null_user" do
      expect(subject).to_not permit(null_user, Campus.new)
    end
  end
end
