require 'spec_helper'

RSpec.describe EventPolicy do
  subject { described_class }
  let(:admin) { create(:admin_user) }
  let(:events_admin) { create(:events_admin_user) }
  let(:user) { create(:user) }
  let(:null_user) { NullUser.new }

  permissions :index?, :show? do
    it "grants admin access" do
      expect(subject).to permit(admin, Event.new)
    end
    it "grants events_admin acess" do
      expect(subject).to permit(admin, Event.new)
    end
    it "grants users access" do
      expect(subject).to permit(user, Event.new)
    end
    it "grants null_users access" do
      expect(subject).to permit(null_user, Event.new)
    end
  end

  permissions :new?, :create?, :edit?, :update?, :destroy?, :view_admin? do
    it "grants admin access" do
      expect(subject).to permit(admin, Event.new)
    end
    it "grants events_admin access" do
      expect(subject).to permit(events_admin, Event.new)
    end
    it "denies user access" do
      expect(subject).to_not permit(user, Event.new)
    end
    it "denies null_user access" do
      expect(subject).to_not permit(null_user, Event.new)
    end
  end
end
