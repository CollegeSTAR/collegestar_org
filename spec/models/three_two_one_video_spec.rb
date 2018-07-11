require 'spec_helper'

RSpec.describe ThreeTwoOneVideo do
  let(:video) { create(:three_two_one_video) }
  let(:released_video) { create(:released_three_two_one_video) }

  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:slug) }
  end

  describe "screenshot" do
    it "attaches a screenshot" do
      video.screenshot.attach(io: file_fixture("upload.png").open, filename: "screenshot.png", content_type: "image/png")
      expect(video.screenshot).to be_attached
    end
  end

  describe "released scope" do
    it "Only returns released videos" do
      expect(ThreeTwoOneVideo.released).to match_array([released_video])
    end
  end
  
  describe "unreleased scope" do
    it "Only returns unreleased videos" do
      expect(ThreeTwoOneVideo.unreleased).to match_array([video])
    end
  end

  describe "to_param" do
    it "Returns the slug" do
      expect(video.to_param).to eq(video.slug)
    end
  end
end
