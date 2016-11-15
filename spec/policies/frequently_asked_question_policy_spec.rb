require 'spec_helper'

RSpec.describe FrequentlyAskedQuestionPolicy do
  subject { described_class }
  let(:admin) { create(:admin_user) }
  let(:content_editor) { create(:content_editor_user) }
  let(:user) { create(:user) }
  let(:null_user) { NullUser.new }

  permissions :index? do
    it "grants admin access" do
      expect(subject).to permit(admin, FrequentlyAskedQuestion.new)
    end    
    it "grants content_editor access" do
      expect(subject).to permit(content_editor, FrequentlyAskedQuestion.new)
    end
    it "grants user access" do
      expect(subject).to permit(user, FrequentlyAskedQuestion.new)
    end
    it "grants null_user access" do
      expect(subject).to permit(null_user, FrequentlyAskedQuestion.new)
    end
  end
  
  permissions :new?, :create?, :edit?, :update?, :destroy?, :view_admin? do
    it "grants admin access" do
      expect(subject).to permit(admin, FrequentlyAskedQuestion.new)
    end    
    it "grants content_editor access" do
      expect(subject).to permit(content_editor, FrequentlyAskedQuestion.new)
    end
    it "denies user access" do
      expect(subject).to_not permit(user, FrequentlyAskedQuestion.new)
    end
    it "denies null_user access" do
      expect(subject).to_not permit(null_user, FrequentlyAskedQuestion.new)
    end
  end

end
