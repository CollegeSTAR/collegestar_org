require 'spec_helper'

RSpec.describe Event do
  let(:event) { create(:event) } 
  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:slug) }
  end

  describe "to_param" do
    it "returns slug" do
      expect(event.to_param).to eq(event.slug) 
    end
  end
end
