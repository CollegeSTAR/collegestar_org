require 'spec_helper'

RSpec.describe PagePolicy do
  subject { described_class }
  let(:admin) { create(:admin_user) }
  let(:page_admin) { create(:page_admin_user) }
  let(:user) { create(:user) }
  let(:null_user) { NullUser.new }

  permissions :index?, :new?, :create?, :edit?, :update?, :destroy?, :view_admin? do
    it "grants admin access" do
      expect(subject).to permit(admin, Page.new)
    end
    
    it "grants page_admin access" do
      expect(subject).to permit(page_admin, Page.new)
    end

    it "denies user access" do
      expect(subject).to_not permit(user, Page.new)
    end

    it "denies null_user access" do
      expect(subject).to_not permit(null_user, Page.new)
    end
  end
end
