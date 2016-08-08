require 'spec_helper'

RSpec.describe UdlModuleSectionPolicy do
  subject { described_class }
  let(:admin) { create(:admin_user) }
  let(:module_admin) { create(:modules_admin_user) }
  let(:module_author) { create(:modules_author_user) }
  let(:module_author_2) { create(:modules_author_user) }
  let(:author_owned_module) { create(:udl_module) }
  let(:user) { create(:user) }
  let(:null_user) { NullUser.new }

  permissions :destroy? do
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
      expect(subject).to_not permit(module_author_2, author_owned_module)
    end
    it "denies users access to modules" do
      expect(subject).to_not permit(user, UdlModule.new)
    end
    it "deines null_users access to modules" do
      expect(subject).to_not permit(null_user, UdlModule.new)
    end
  end
end
