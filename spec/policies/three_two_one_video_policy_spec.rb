require 'spec_helper'

RSpec.describe ThreeTwoOneVideoPolicy do
  subject {described_class}
  let(:unreleased_video) { create(:three_two_one_video) }
  let(:released_video) { create(:released_three_two_one_video) }
  let(:admin) { create(:admin_user) }
  let(:video_admin) { create(:three_two_one_videos_admin_user) }
  let(:user) { create(:user) }
  let(:null_user) { NullUser.new }

  permissions :index? do
    it "grants admin access" do
      expect(subject).to permit(admin, ThreeTwoOneVideo)
    end
    it "grants video admin access" do
      expect(subject).to permit(video_admin, ThreeTwoOneVideo)
    end
    it "grants user access" do
      expect(subject).to permit(user, ThreeTwoOneVideo)
    end
    it "grants null user access" do
      expect(subject).to permit(null_user, ThreeTwoOneVideo)
    end
  end

  permissions :show? do
    context "Released video" do
      it "grants admin access" do
        expect(subject).to permit(admin, released_video)
      end
      it "grants video admin access" do
        expect(subject).to permit(video_admin, released_video)
      end
      it "grants user acess" do
        expect(subject).to permit(user, released_video)
      end
      it "grants null user access" do
        expect(subject).to permit(null_user, released_video)
      end
    end
    context "Unreleased video" do
      it "grants admin access" do
        expect(subject).to permit(admin, unreleased_video)
      end
      it "grants video admin access" do
        expect(subject).to permit(video_admin, unreleased_video)
      end
      it "denies user acess" do
        expect(subject).to_not permit(user, unreleased_video)
      end
      it "denies null user access" do
        expect(subject).to_not permit(null_user, unreleased_video)
      end
    end
 end

 permissions :new?, :create?, :edit?, :update?, :view_admin? do
   it "grants admin access" do
     expect(subject).to permit(admin, unreleased_video)
   end
   it "grants video_admin access" do
     expect(subject).to permit(video_admin, unreleased_video)
   end
   it "denies user access" do
     expect(subject).to_not permit(user, unreleased_video)
   end
   it "denies null user access" do
     expect(subject).to_not permit(null_user, unreleased_video)
   end
 end
end
