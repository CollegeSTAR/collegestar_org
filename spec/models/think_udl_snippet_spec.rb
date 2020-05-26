require 'spec_helper'

RSpec.describe ThinkUdlSnippet do
  
  describe "Validations" do
    it { should validate_presence_of(:video_url) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:episode_url) }
    it { should validate_presence_of(:episode_title) }
    it { should validate_presence_of(:episode_description) }
  end
end
