require 'spec_helper'

RSpec.describe UserModuleHistoryPolicy do
  subject {described_class}
  let(:user) { create(:user) }
  let(:user_with_no_module_history) { create(:user) }
  let(:user_with_module_history) { create(:user) }
  let(:null_user) { NullUser.new }
  let(:user_module_history) { create(:user_module_history, user: user_with_module_history) }

  permissions :index? do
    it "grants user access" do
      expect(subject).to permit(user, UserModuleHistoryPolicy)
    end

    it "denies null user access" do
      expect(subject).to_not permit(null_user, UserModuleHistoryPolicy)
    end
  end

  permissions :show? do
    it "grants users access to their module history" do
      expect(subject).to permit(user_with_module_history, user_module_history)
    end
    it "denies users access to other users' module history" do
      expect(subject).to_not permit(user_with_no_module_history, user_module_history)
    end
    it "denies null_user access to users' module history" do
      expect(subject).to_not permit(null_user, user_module_history)
    end
  end
end
