require 'spec_helper'

RSpec.describe ContactPolicy do
  subject { described_class }
  let(:admin) { create(:admin_user) }
  let(:contacts_admin) { create(:contacts_admin_user) }
  let(:user) { create(:user) }
  let(:null_user) { NullUser.new }

  permissions :new?, :create? do
    it "grants admin access" do
      expect(subject).to permit(admin, Contact.new)
    end

    it "grants contacts_admin access" do
      expect(subject).to permit(contacts_admin, Contact.new)
    end
    
    it "grants user access" do
      expect(subject).to permit(user, Contact.new)
    end    
    
    it "grants null_user access" do
      expect(subject).to permit(null_user, Contact.new)
    end
  end

  permissions :index?, :show?, :view_admin? do
    it "grants admin access" do
      expect(subject).to permit(admin, Contact.new)
    end

    it "grants contacts_admin access" do
      expect(subject).to permit(contacts_admin, Contact.new)
    end
    
    it "denies user access" do
      expect(subject).to_not permit(user, Contact.new)
    end    
    
    it "denies null_user access" do
      expect(subject).to_not permit(null_user, Contact.new)
    end

  end
end
