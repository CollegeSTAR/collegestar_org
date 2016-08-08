require 'spec_helper'

RSpec.describe UdlModulePolicy do
  subject { described_class }
  let(:admin) { create(:admin_user) }
  let(:module_admin) { create(:modules_admin_user) }
  let(:module_author) { create(:modules_author_user) }
  let(:another_modules_author) { create(:modules_author_user) }
  let(:author_owned_module) { create(:udl_module) }
  let(:user) { create(:user) }
  let(:null_user) { NullUser.new }
  
  permissions :index?, :show? do
        it "grants admins access" do
      expect(subject).to permit(admin, UdlModule.new)
    end
    it "grants module_admins access" do
      expect(subject).to permit(module_admin, UdlModule.new)
    end
    it "grants module_authors access" do
      expect(subject).to permit(module_author, UdlModule.new)
    end
    it "grants users access" do
      expect(subject).to permit(user, UdlModule.new)
    end
    it "grants null_users access" do
      expect(subject).to permit(null_user, UdlModule.new)
    end
  end

  permissions :new?, :create? do
    it "grants admins access" do
      expect(subject).to permit(admin, UdlModule.new)
    end
    it "grants module_admins access" do
      expect(subject).to permit(module_admin, UdlModule.new)
    end
    it "grants module_authors access" do
      expect(subject).to permit(module_author, UdlModule.new)
    end
    it "denies users access" do
      expect(subject).to_not permit(user, UdlModule.new)
    end
    it "denies null_users access" do
      expect(subject).to_not permit(null_user, UdlModule.new)
    end
  end

  permissions :edit?, :update? do
    it "grants admins access" do
      expect(subject).to permit(admin, UdlModule.new)
    end
    it "grants module_admins access" do
      expect(subject).to permit(module_admin, UdlModule.new)
    end
    it "grants module_authors access to modules they own" do
      author_owned_module.authors << module_author
      expect(subject).to permit(module_author, author_owned_module)
    end
    it "denies module_authors access to modules they do not own" do
      author_owned_module.authors << module_author
      expect(subject).to_not permit(another_modules_author, author_owned_module)
    end
    it "denies users access to modules" do
      expect(subject).to_not permit(user, UdlModule.new)
    end
    it "deines null_users access to modules" do
      expect(subject).to_not permit(null_user, UdlModule.new)
    end
  end

  permissions :destroy? do
    it "grants admins access" do
      expect(subject).to permit(admin, UdlModule.new)
    end
    it "denies module_admins access" do
      expect(subject).to_not permit(module_admin, UdlModule.new)
    end
    it "denies module_authors access" do
      expect(subject).to_not permit(module_author, UdlModule.new)
    end
    it "denies users access" do
      expect(subject).to_not permit(user, UdlModule.new)
    end
    it "deines null_user access" do
      expect(subject).to_not permit(null_user, UdlModule.new)
    end
  end

  permissions :admin? do
    it "grants admins access" do
      expect(subject).to permit(admin, UdlModule.new)
    end
    it "grants module_admins access" do
      expect(subject).to permit(module_admin, UdlModule.new)
    end
    it "denies module_authors access" do
      expect(subject).to_not permit(module_author, UdlModule.new)
    end
    it "denies users access" do
      expect(subject).to_not permit(user, UdlModule.new)
    end
    it "denies null_users access" do
      expect(subject).to_not permit(null_user, UdlModule.new)
    end
  end

  permissions :view_admin? do
    it "grants admins access" do
      expect(subject).to permit(admin, UdlModule.new)
    end
    it "grants module_admin access" do
      expect(subject).to permit(module_admin, UdlModule.new)
    end
    it "grants module_author access" do
      expect(subject).to permit(module_author, UdlModule.new)
    end
    it "denies user access" do
      expect(subject).to_not permit(user, UdlModule.new)
    end
    it "denies null_user access" do
      expect(subject).to_not permit(null_user, UdlModule.new)
    end
  end
end
